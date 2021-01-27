# frozen_string_literal: true

require './db/sql/stop_list'
require './wpt/helper'

module WPT
  module Stop
    class StopList
      include WPT::Helper

      def call
        call_block { @result = fetch_data }
      end

      private

      def fetch_data
        [].tap do |rows|
          DB::SQL::StopList.new.execute.each do |stop|
            rows << [stop[1], stop[2]]
          end
        end
      end
    end
  end
end
