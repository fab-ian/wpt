# frozen_string_literal: true

module DB
  module SQL
    class Base
      def execute
        WPT::DB_HANDLER.execute query, arg
      end

      def arg
        []
      end
    end
  end
end
