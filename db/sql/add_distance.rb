# frozen_string_literal: true

require './db/sql/base'

module DB
  module SQL
    class AddDistance < Base
      def query
        <<-SQL
          INSERT into distances (line, latitude, longitude, vehicle_number, brigade, distance, created)
          values(?, ?, ?, ?, ?, ?, ?)
        SQL
      end
    end
  end
end
