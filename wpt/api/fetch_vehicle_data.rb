# frozen_string_literal: true

require './wpt/api/base'

module WPT
  module API
    class FetchVehicleData < Base
      def endpoint
        'api/action/busestrams_get/?resource_id=f2e5503e-927d-4ad3-9500-4ab9e55deb59'
      end

      def fetch
        result = super
        api_error?(result) ? { result: [] } : result
      end

      private

      def api_error?(result)
        result[:result] == 'Błędna metoda lub parametry wywołania'
      end
    end
  end
end
