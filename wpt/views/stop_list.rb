# frozen_string_literal: true

require 'terminal-table'
require './wpt/requirements'
require './wpt/helper'
require './wpt/stop/stop_list'

module WPT
  module Views
    class StopList
      include WPT::Helper

      def call
        call_block do
          raise 'Requirements' unless WPT::Requirements.new(:list).passed?

          rows = WPT::Stop::StopList.new.call[:result]
          print_table(rows)
        end
      end

      private

      def print_table(rows)
        puts Terminal::Table.new headings: %w[Stop Post], rows: rows
      end
    end
  end
end
