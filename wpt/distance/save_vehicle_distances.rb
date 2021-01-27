# frozen_string_literal: true

require './wpt/api/fetch_vehicle_data'
require './db/sql/add_distance'
require './wpt/distance/calculate_distance'

module WPT
  module Distance
    class SaveVehicleDistance
      def initialize(answer, created)
        @answer = answer
        @created = created
        @distance = CalculateDistance.new(@answer[:stop_id])
      end

      def call
        fetch_vehicle_data[:result].each do |vehicle_data|
          line = vehicle_data[:Lines]
          latitude = vehicle_data[:Lat]
          longitude = vehicle_data[:Lon]
          vehicle_number = vehicle_data[:VehicleNumber]
          brigade = vehicle_data[:Brigade]
          distance = calculate_distance(latitude, longitude)

          DB::SQL::AddDistance.new(line, latitude, longitude, vehicle_number, brigade, distance, @created).execute
        end
      end

      private

      def fetch_vehicle_data
        WPT::API::FetchVehicleData.new([{ type: @answer[:vehicle_type] }, { line: @answer[:vehicle_number] }]).fetch
      end

      def calculate_distance(latitude, longitude)
        @distance.call(latitude, longitude)
      end
    end
  end
end
