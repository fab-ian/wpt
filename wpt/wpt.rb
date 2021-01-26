# frozen_string_literal: true

require 'optparse'
require 'pry-byebug'
require 'sqlite3'
require 'tty-prompt'
require 'tty-config'

require './wpt/settings'
require './wpt/setup/setup'
require './wpt/stop/stop_list'
require './wpt/distance/distance'

require './wpt/views/define_stop'
require './wpt/error_handler'

module WPT
  def self.parse_arguments
    OptionParser.new do |opts|
      opts.on('-s', '--setup', 'Setup database and import Stop information from API') { Setup::Setup.new.call }
      opts.on('-l', '--list', 'Show my Stops') { list }
      opts.on('-f', '--find', 'Find bus/tram stop') { find  }
      opts.on('-d', '--distance', 'Show distance between my stop and chosen vehicle') { Distance::Distance.new.call }
    end.parse!
  end

  def self.find
    result = Views::DefineStop.new.call
    list if result[:error].nil?
    ErrorHandler.message(result) unless result[:error].nil?
  end

  def self.list
    Stop::StopList.new.call
  end
end

WPT.parse_arguments
