# frozen_string_literal: true

require 'terminal-table'
require './db/sql/stop_list'
require './wpt/requirements'

module WPT
  module Stop
    class StopList
      def call
        raise 'Requirements' unless WPT::Requirements.new(:list).passed?

        create_table
      rescue RuntimeError => e
        puts 'First you must setup the app using `ruby wpt/wpt.rb -s`' if e.message == 'Requirements'
      end

      private

      def create_table
        rows = []

        DB::SQL::StopList.new.execute.each do |stop|
          rows << [stop[1], stop[2]]
        end

        puts Terminal::Table.new headings: %w[Stop Post], rows: rows
      end
    end
  end
end
