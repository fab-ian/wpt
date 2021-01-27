# frozen_string_literal: true

require 'geokit'
require './db/sql/stop_info'

module WPT
  module Distance
    class CalculateDistance
      def initialize(stop_id)
        @stop_id = stop_id
      end

      def call(latitude, longitude)
        Geokit.default_units = :kms

        stop_location = Geokit::LatLng.from_string(stop_position)
        vehicle_location = "#{latitude},#{longitude}"
        stop_location.distance_to(vehicle_location)
      end

      private

      def stop_position
        result = DB::SQL::StopInfo.new(@stop_id).execute
        "#{result.first[0]},#{result.first[1]}"
      end
    end
  end
end
