# frozen_string_literal: true

module DB
  module SQL
    class Base
      def initialize(args = [])
        @args = args
      end

      def execute
        WPT::DB_HANDLER.execute query, @args
      end
    end
  end
end
