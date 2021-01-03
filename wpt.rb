# frozen_string_literal: true

require 'cli/ui'

module WPT
  class Start
    def say_hello
      'Hello World'
    end
  end
end

puts CLI::UI.fmt "{{green:#{WPT::Start.new.say_hello}}}"
