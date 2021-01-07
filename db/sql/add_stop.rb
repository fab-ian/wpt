# frozen_string_literal: true

require './db/sql/base'

module DB
  module SQL
    class AddStop < Base
      def query
        <<-SQL
          INSERT into my_stops (stop_id) values(?)
        SQL
      end
    end
  end
end
