# frozen_string_literal: true

module WPT
  module Helper
    def call_block
      yield
      result_handler(result: @result)
    rescue StandardError => e
      result_handler(error: e.message)
    end

    def result_handler(**data)
      { result: data[:result], error: data[:error] }
    end
  end
end
