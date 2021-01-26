# frozen_string_literal: true

require './db/sql/add_stop'
require './wpt/helper'

module WPT
  module Stop
    class Add
      include WPT::Helper

      def initialize(stop_id)
        @stop_id = stop_id
      end

      def call
        call_block do
          DB::SQL::AddStop.new(@stop_id).execute
        end
      end
    end
  end
end
