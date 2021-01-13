# frozen_string_literal: true

require './db/sql/base'

module DB
  module SQL
    class MyStopsCount < Base
      def query
        <<-SQL
          SELECT COUNT(*) as my_stops_count FROM  my_stops
        SQL
      end
    end
  end
end
