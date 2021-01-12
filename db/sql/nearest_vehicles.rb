# frozen_string_literal: true

require './db/sql/base'

module DB
  module SQL
    class NearestVehicles < Base
      def query
        <<-SQL
          SELECT vehicle_number,last_distance, second_last_distance, (last_distance - second_last_distance) AS progress from (
            SELECT vehicle_number
            , (SELECT distance from distances d2 WHERE d2.vehicle_number = d.vehicle_number ORDER by id DESC limit 1) AS last_distance
            , (SELECT distance from distances d3 WHERE d3.vehicle_number = d.vehicle_number ORDER by id DESC limit 1 OFFSET 1) AS second_last_distance
            FROM distances AS d
            WHERE created = ?
          ) WHERE progress <= 0
          ORDER by last_distance
        SQL
      end
    end
  end
end
