# frozen_string_literal: true

require 'optparse'
require 'pry-byebug'
require 'sqlite3'
require 'tty-prompt'
require 'tty-config'

require './wpt/settings'
require './wpt/setup/setup'
require './wpt/stop/stop_list'
require './wpt/stop/find'
require './wpt/distance/distance'

module WPT
  class Start
    def say_hello
      'Hello World'
    end
  end

  def self.parse_arguments
    OptionParser.new do |opts|
      opts.on('-s', '--setup', 'Setup database and import Stop information from API') { Setup::Setup.new.call }
      opts.on('-l', '--list', 'Show my Stops') { Stop::StopList.new.call }
      opts.on('-f', '--find', 'Find your bus/tram stop') { Stop::Find.new.call }
      opts.on('-d', '--distance', 'Show distance between my stop and chosen vehicle') { Distance::Distance.new.call }
    end.parse!
  end
end

WPT.parse_arguments
# puts CLI::UI.fmt "{{green:#{WPT::Start.new.say_hello}}}"
