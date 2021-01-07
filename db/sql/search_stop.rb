# frozen_string_literal: true

require './db/sql/base'

module DB
  module SQL
    class SearchStop < Base
      def query
        <<-SQL
          SELECT id, stop_name, post from stops where
          stop_name like ? COLLATE NOCASE
          ORDER BY stop_name ASC
        SQL
      end
    end
  end
end
