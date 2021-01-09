# frozen_string_literal: true

require 'geokit'
require 'pastel'
require './db/sql/stop_info'
require './wpt/api/fetch_vehicle_data'
require './db/sql/add_distance'
require './db/sql/nearest_vehicles'

module WPT
  module Distance
    class Distance
      def call
        @prompt = TTY::Prompt.new

        @answer = {}
        @answer[:stop_id] = @prompt.select('Select your stop:', my_stops)
        @answer[:vehicle_type] = @prompt.select('Choose vehicle type:', vehicles)
        @answer[:vehicle_number] = @prompt.ask('Enter vehicle number:', required: true)

        stop_position
        show_distances
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
        pastel = Pastel.new

        DB::SQL::NearestVehicles.new([@answer[:vehicle_number]]).execute.each do |distance|
          puts "Vehicle Number: #{pastel.red(distance[0])} distance: #{pastel.green(distance[1])}"
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

      def stop_position
        result = DB::SQL::StopInfo.new([@answer[:stop_id]]).execute
        @answer[:latitude] = result.first[0]
        @answer[:longitude] = result.first[1]
      end

      def fetch_vehicle_data
        WPT::API::FetchVehicleData.new([{ type: @answer[:vehicle_type] }, { line: @answer[:vehicle_number] }]).fetch
      end

      def save_vehicle_distances
        fetch_vehicle_data[:result].each do |vehicle_data|
          line = vehicle_data[:Lines]
          latitude = vehicle_data[:Lat]
          longitude = vehicle_data[:Lon]
          vehicle_number = vehicle_data[:VehicleNumber]
          brigade = vehicle_data[:Brigade]
          distance = calculate_distance(latitude, longitude)

          DB::SQL::AddDistance.new([line, latitude, longitude, vehicle_number, brigade, distance]).execute
        end
      end

      def calculate_distance(latitude, longitude)
        Geokit.default_units = :kms

        stop_location = Geokit::LatLng.new(@answer[:latitude], @answer[:longitude])
        vehicle_location = "#{latitude},#{longitude}"
        stop_location.distance_to(vehicle_location)
      end
    end
  end
end
