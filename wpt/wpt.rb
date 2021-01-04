# frozen_string_literal: true

require 'optparse'
require 'cli/ui'

require './wpt/setup'

module WPT
  class Start
    def say_hello
      'Hello World'
    end
  end

  def self.parse_arguments
    OptionParser.new do |opts|
      opts.on('-s', '--setup', 'Setup database and import Stop information from API') do
        Setup.new.call
      end
    end.parse!
  end
end

WPT.parse_arguments
# puts CLI::UI.fmt "{{green:#{WPT::Start.new.say_hello}}}"
