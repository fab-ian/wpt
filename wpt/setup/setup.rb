# frozen_string_literal: true

require 'tty-spinner'
require './wpt/api/fetch_stops'
require './wpt/setup/prepare_sql_script'

module WPT
  module Setup
    class Setup
      def call
        TTY::Spinner
          .new('[:spinner] Fetch Stops data using API', format: :arrow_pulse)
          .run('(done!)') { |_spinner| fetch_stops_data }
        TTY::Spinner
          .new('[:spinner] Prepare SQL Script', format: :arrow_pulse)
          .run('(done!)') { |_spinner| prepare_sql_script }
        TTY::Spinner
          .new('[:spinner] Execute SQL Script', format: :arrow_pulse)
          .run('(done!)') { |_spinner| execute_sql_script }
      end

      private

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
