# frozen_string_literal: true

require 'optparse'
require 'pry-byebug'
require 'sqlite3'
require 'tty-prompt'

require './wpt/setup/setup'
require './wpt/stop/stop_list'
require './wpt/stop/find'

module WPT
  DB_NAME = 'wpt.db'
  DB_HANDLER = SQLite3::Database.new "db/#{DB_NAME}"

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
    end.parse!
  end
end

WPT.parse_arguments
# puts CLI::UI.fmt "{{green:#{WPT::Start.new.say_hello}}}"
