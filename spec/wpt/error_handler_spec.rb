# frozen_string_literal: true

require './wpt/wpt'
require './wpt/error_handler'

describe WPT::ErrorHandler do
  let(:no_stop_found_error) { described_class.message(result) }

  context 'when error code equal to NoStopFounds' do
    let(:result) { { result: nil, error: 'NoStopFounds' } }

    it 'returns error message' do
      expect { no_stop_found_error }.to output(/No stop found/).to_stdout
    end
  end

  context 'when error code equal to Requirements' do
    let(:result) { { result: nil, error: 'Requirements' } }

    it 'returns error message' do
      expect { no_stop_found_error }.to output(/First you must setup/).to_stdout
    end
  end
end
