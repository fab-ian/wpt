# frozen_string_literal: true

require './db/sql/nearest_vehicles'
require './wpt/views/distance_result_view'
require './wpt/requirements'
require './wpt/distance/save_vehicle_distances'
require './wpt/helper'

module WPT
  module Views
    class Distance
      include WPT::Helper

      def initialize
        @prompt = TTY::Prompt.new
      end

      def call
        call_block do
          raise 'Requirements' unless WPT::Requirements.new(:distance).passed?

          collect_info_from_tty
          show_distances
        end
      end

      private

      def show_distances
        interrupted = false
        trap('INT') { interrupted = true } # traps Ctrl-C
        @prompt.warn('Press Ctrl-C to exit. First result will show up after 30s. Next will appear after 15s')

        first_loop = true

        until interrupted
          save_vehicle_distances
          nearest_vehicles unless first_loop
          sleep(15)
          first_loop = false
        end
      end

      def nearest_vehicles
        result = DistanceResultView.new

        DB::SQL::NearestVehicles.new(@created).execute.each do |distance|
          puts result.call(distance)
        end
        puts '----'
      end

      def my_stops
        DB::SQL::StopList
          .new
          .execute
          .map { |values| { name: "#{values[1]} (#{values[2]})", value: values[0] } }
      end

      def vehicles
        [
          { name: 'Bus', value: 1 },
          { name: 'Tram', value: 2 }
        ]
      end

      def save_vehicle_distances
        @created = Time.new.to_i
        WPT::Distance::SaveVehicleDistance.new(@answer, @created).call
      end

      def collect_info_from_tty
        @answer = {}
        @answer[:stop_id] = @prompt.select('Select your stop:', my_stops)
        @answer[:vehicle_type] = @prompt.select('Choose vehicle type:', vehicles)
        @answer[:line] = @prompt.ask('Enter vehicle number:', required: true)
      end
    end
  end
end
