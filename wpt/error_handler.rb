# frozen_string_literal: true

module WPT
  module ErrorHandler
    def self.message(result)
      case result[:error]
      when 'Requirements'
        puts('First you must setup the app using `ruby wpt/wpt.rb -s`')
      when 'NoStopFounds'
        puts('No stop found :( Try less complex syntax.')
      end
    end
  end
end
