# frozen_string_literal: true

require 'optparse'
require 'cli/ui'
require 'pry-byebug'
require 'sqlite3'

require './wpt/setup/setup'
require './wpt/setup/prepare_sql_script'
require './wpt/api/base'
require './wpt/api/fetch_stops'

module WPT
  class Start
    def say_hello
      'Hello World'
    end
  end

  def self.parse_arguments
    CLI::UI::StdoutRouter.enable

    OptionParser.new do |opts|
      opts.on('-s', '--setup', 'Setup database and import Stop information from API') do
        Setup::Setup.new.call
      end
    end.parse!
  end
end

WPT.parse_arguments
# puts CLI::UI.fmt "{{green:#{WPT::Start.new.say_hello}}}"
