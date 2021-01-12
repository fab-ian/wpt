# frozen_string_literal: true

require 'pastel'

module WPT
  module Distance
    class ResultView
      def initialize
        @pastel = Pastel.new
      end

      def call(distance)
        @distance = distance
        "Vehicle Number: #{vehicle_number} distance: #{distance_label} #{stop_label}"
      end

      private

      def distance_label
        @pastel.green("#{@distance[1].round(2)} km")
      end

      def vehicle_number
        @pastel.red(@distance[0])
      end

      def stop_label
        @distance[3].zero? ? @pastel.yellow('(Stop)') : ''
      end
    end
  end
end
