# frozen_string_literal: true

require './wpt/api/base'

module WPT
  module API
    class FetchStops < Base
      def endpoint
        'api/action/dbstore_get/?id=ab75c33d-3a26-4342-b36a-6e5fef0a3ac3'
      end
    end
  end
end
