# frozen_string_literal: true

require './wpt/stop/find'
require './wpt/stop/add'
require './wpt/requirements'
require './wpt/helper'

module WPT
  module Views
    class DefineStop
      include WPT::Helper

      def initialize(prompt = nil)
        @prompt = prompt || TTY::Prompt.new
      end

      def call
        call_block do
          raise 'Requirements' unless requirements_passed?

          enter_key_word
          find_stops
          choose_your_stop
          add_stop
        end
      end

      private

      def requirements_passed?
        WPT::Requirements.new(:find).passed?
      end

      def enter_key_word
        @key_word = @prompt.ask('Enter your bus/tram stop name: ', required: true)
      end

      def find_stops
        find_result = WPT::Stop::Find.new(@key_word).call
        find_result[:error].nil? ? @found_stops = find_result[:result] : raise(find_result[:error])
      end

      def choose_your_stop
        @stop_id = @prompt.select('Choose your stop...', @found_stops)
      end

      def add_stop
        WPT::Stop::Add.new(@stop_id).call
      end
    end
  end
end
