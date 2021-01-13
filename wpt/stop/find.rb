# frozen_string_literal: true

require './db/sql/search_stop'
require './db/sql/add_stop'
require './wpt/stop/stop_list'
require './wpt/requirements'

module WPT
  module Stop
    class Find
      def initialize
        @prompt = TTY::Prompt.new
      end

      def call
        raise 'Requirements' unless requirements_passed?

        enter_key_word
        @result = search_for_stops
        raise 'NoStopFounds' if @result.empty?

        choose_your_stop
        add_stop
        StopList.new.call
      rescue StandardError => e
        puts('First you must setup the app using `ruby wpt/wpt.rb -s`') if e.message == 'Requirements'
        puts('No stop found :( Try less complex syntax.') if e.message == 'NoStopFounds'
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

      def requirements_passed?
        WPT::Requirements.new(:find).passed?
      end

      def enter_key_word
        @key_word = @prompt.ask('Enter your bus/tram stop name: ', required: true)
      end

      def choose_your_stop
        @stop_id = @prompt.select('Choose your stop...', convert_data)
      end
    end
  end
end
