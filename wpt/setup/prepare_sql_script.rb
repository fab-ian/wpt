# frozen_string_literal: true

module WPT
  module Setup
    class PrepareSqlScript
      def initialize(spinner)
        @spinner = spinner
      end

      def call
        # @spinner.update_title('Error!')
      end
    end
  end
end
