# frozen_string_literal: false

require 'httparty'

module WPT
  module API
    class Base
      def initialize(params = [])
        @params = params
      end

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
        "#{domain}#{endpoint}&apikey=#{api_key}#{url_params}"
      end

      def url_params
        ''.tap do |str|
          @params.each { |param| str << "&#{param.keys.first}=#{param.values.first}" }
        end
      end
    end
  end
end
