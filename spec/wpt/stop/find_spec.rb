# frozen_string_literal: true

require './wpt/wpt'
require './wpt/stop/find'

describe WPT::Stop::Find do
  context 'when stop exist' do
    subject { described_class.new('hal') }
    let(:stop_results) { YAML.load_file('spec/fixtures/wpt/stop/find.yaml') }

    it 'returns a group of stops for pl. Hallera' do
      expect(subject.call).to include(stop_results)
    end
  end

  context 'when stop does not exist' do
    subject { described_class.new('halllll') }

    it 'returns an error code' do
      expect(subject.call).to include({ error: 'NoStopFounds' })
    end
  end
end
