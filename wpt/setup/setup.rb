# frozen_string_literal: true

module WPT
  module Setup
    class Setup
      def call
        CLI::UI::Spinner.spin('Create DB') { create_sqlite_db3 }
        CLI::UI::Spinner.spin('Fetch Stops data using API') { fetch_stops_data }
        CLI::UI::Spinner.spin('Prepare SQL Script') { prepare_sql_script }
        CLI::UI::Spinner.spin('Execute SQL Script') { execute_sql_script }
      end

      private

      def create_sqlite_db3
        SQLite3::Database.new 'db/wpt.db'
      end

      def fetch_stops_data
        @stops = WPT::API::FetchStops.new.fetch
      end

      def prepare_sql_script
        PrepareSqlScript.new(@stops).call
      end

      def execute_sql_script
        `sqlite3 db/wpt.db ".read db/create_tables_and_import_data.sql"`
      end
    end
  end
end
