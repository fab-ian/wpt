# frozen_string_literal: true

require './db/sql/base'

module DB
  module SQL
    class StopInfo < Base
      def query
        <<-SQL
          SELECT latitude, longitude from stops where id = ?
        SQL
      end
    end
  end
end
