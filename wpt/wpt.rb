# frozen_string_literal: true

require 'optparse'
require 'pry-byebug'
require 'sqlite3'
require 'tty-prompt'
require 'tty-config'

require './wpt/settings'
require './wpt/error_handler'
require './wpt/views/define_stop'
require './wpt/views/stop_list'
require './wpt/views/setup'
require './wpt/views/distance'

module WPT
  class Controller
    def parse_arguments
      OptionParser.new do |opts|
        opts.on('-s', '--setup', 'Setup database and import Stop information from API') { setup }
        opts.on('-l', '--list', 'Show my Stops') { list }
        opts.on('-f', '--find', 'Find bus/tram stop') { find  }
        opts.on('-d', '--distance', 'Show distance between my stop and chosen vehicle') { distance }
      end.parse!
    end

    def find
      execute_task_and_handle_error do
        @result = Views::DefineStop.new.call
        list if @result[:error].nil?
      end
    end

    def list
      execute_task_and_handle_error { @result = Views::StopList.new.call }
    end

    def setup
      execute_task_and_handle_error { @result = Views::Setup.new.call }
    end

    def distance
      execute_task_and_handle_error { @result = Views::Distance.new.call }
    end

    private

    def execute_task_and_handle_error
      yield
      ErrorHandler.message(@result) unless @result[:error].nil?
    end
  end
end

WPT::Controller.new.parse_arguments
