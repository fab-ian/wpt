# frozen_string_literal: true

require 'tty-spinner'
require './wpt/api/fetch_stops'
require './wpt/setup/prepare_sql_script'
require './wpt/helper'

module WPT
  module Views
    class Setup
      include WPT::Helper

      def call
        call_block do
          TTY::Spinner.new('[:spinner] Fetch Stops data using API', format: :arrow_pulse)
                      .run('(done!)') { |_spinner| fetch_stops_data }
          TTY::Spinner.new('[:spinner] Prepare SQL Script', format: :arrow_pulse)
                      .run('(done!)') { |_spinner| prepare_sql_script }
          TTY::Spinner.new('[:spinner] Execute SQL Script', format: :arrow_pulse)
                      .run('(done!)') { |_spinner| execute_sql_script }
        end
      end

      private

      def fetch_stops_data
        @stops = WPT::API::FetchStops.new.fetch
      end

      def prepare_sql_script
        WPT::Setup::PrepareSqlScript.new(@stops).call
      end

      def execute_sql_script
        `sqlite3 db/wpt.db ".read db/create_tables_and_import_data.sql"`
      end
    end
  end
end
