# frozen_string_literal: true

module DB
  module SQL
    class StopList < Base
      def query
        <<-SQL
          SELECT stop_id, s.stop_name, s.post
          FROM my_stops AS m
          JOIN stops AS s ON s.id = stop_id
        SQL
      end
    end
  end
end
