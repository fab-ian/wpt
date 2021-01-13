# frozen_string_literal: true

require './db/sql/table_exist'
require './db/sql/my_stops_count'

module WPT
  class Requirements
    def initialize(option)
      @option = option
    end

    def passed?
      case @option
      when :list
        my_stops_table_exist?
      when :find
        my_stops_table_exist? && stops_table_exist?
      when :distance
        distance_table_exist? && my_stop_defined?
      end
    end

    private

    def my_stops_table_exist?
      DB::SQL::TableExist.new('my_stops').execute.first[0] == 1
    end

    def stops_table_exist?
      DB::SQL::TableExist.new('stops').execute.first[0] == 1
    end

    def distance_table_exist?
      DB::SQL::TableExist.new('distances').execute.first[0] == 1
    end

    def my_stop_defined?
      return false unless my_stops_table_exist?

      DB::SQL::MyStopsCount.new.execute.first[0].positive?
    end
  end
end
