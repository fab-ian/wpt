# frozen_string_literal: true

require 'terminal-table'
require './db/sql/stop_list'

module WPT
  module Stop
    class StopList
      def call
        rows = []

        DB::SQL::StopList.new.execute.each do |stop|
          rows << [stop[1], stop[2]]
        end

        puts Terminal::Table.new headings: %w[Stop Post], rows: rows
      end
    end
  end
end
