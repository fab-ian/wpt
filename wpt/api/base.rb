# frozen_string_literal: true

require 'httparty'

module WPT
  module API
    class Base
      def fetch
        response = HTTParty.get(url, format: :plain)
        JSON.parse response, symbolize_names: true
      end

      private

      def domain
        'https://api.um.warszawa.pl/'
      end

      def api_key
        ENV['WPT_API_KEY']
      end

      def url
        "#{domain}#{endpoint}&apikey=#{api_key}"
      end
    end
  end
end
