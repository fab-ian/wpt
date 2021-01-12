# frozen_string_literal: true

require './db/sql/search_stop'
require './db/sql/add_stop'
require './wpt/stop/stop_list'

module WPT
  module Stop
    class Find
      def call
        prompt = TTY::Prompt.new
        @key_word = prompt.ask('Enter your bus/tram stop name: ', required: true)
        @result = search_for_stops
        @stop_id = prompt.select('Choose your stop...', convert_data)
        add_stop
        StopList.new.call
      rescue StandardError
        prompt.warn('No stop found :( Try less complex syntax.') if @result.empty?
      end

      private

      def search_for_stops
        DB::SQL::SearchStop.new("%#{@key_word}%").execute
      end

      def convert_data
        @result.map { |values| { name: "#{values[1]} (#{values[2]})", value: values[0] } }
      end

      def add_stop
        DB::SQL::AddStop.new(@stop_id).execute
      end
    end
  end
end
