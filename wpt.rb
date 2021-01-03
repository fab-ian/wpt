# frozen_string_literal: true

module WPT
  class Start
    def say_hello
      'Hello World'
    end
  end
end

puts WPT::Start.new.say_hello
