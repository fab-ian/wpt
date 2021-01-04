# frozen_string_literal: true

module WPT
  module Setup
    class Setup
      def call
        CLI::UI::Spinner.spin('Create DB') { create_sqlite_db3 }
        CLI::UI::Spinner.spin('Prepare SQL Script') { |spinner| prepare_sql_script(spinner) }
        CLI::UI::Spinner.spin('Execute SQL Script') { execute_sql_script }
      end

      private

      def create_sqlite_db3
        SQLite3::Database.new 'db/wpt.db'
      end

      def prepare_sql_script(spinner)
        PrepareSqlScript.new(spinner).call
      end

      def execute_sql_script
        `sqlite3 db/wpt.db ".read db/create_tables_and_import_data.sql"`
      end
    end
  end
end
