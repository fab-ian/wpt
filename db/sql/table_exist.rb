# frozen_string_literal: true

require './db/sql/base'

module DB
  module SQL
    class TableExist < Base
      def query
        <<-SQL
          SELECT count(*) as table_exist FROM sqlite_master
          WHERE type = 'table' AND name = ?;
        SQL
      end
    end
  end
end
