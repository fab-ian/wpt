# frozen_string_literal: true

require './db/sql/search_stop'
require './wpt/helper'

module WPT
  module Stop
    class Find
      include WPT::Helper

      def initialize(key_word)
        @key_word = key_word
      end

      def call
        call_block do
          result = search_for_stops
          raise 'NoStopFounds' if result.empty?

          @result = convert_data(result)
        end
      end

      private

      def search_for_stops
        DB::SQL::SearchStop.new("%#{@key_word}%").execute
      end

      def convert_data(result)
        result.map { |values| { name: "#{values[1]} (#{values[2]})", value: values[0] } }
      end
    end
  end
end
