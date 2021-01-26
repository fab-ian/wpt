# frozen_string_literal: true

require './wpt/wpt'
require './wpt/stop/add'

describe WPT::Stop::Add do
  context 'when adding stop to DB succeed' do
    subject { described_class.new(stop_id) }
    let(:stop_id) { 8888 }
    before { subject.call }

    it 'returns added record' do
      db = DB::SQL::Base.new(stop_id)
      db.query = 'SELECT stop_id FROM my_stops WHERE stop_id = ?;'
      result = db.execute

      expect(result.first.first).to eq(stop_id)
    end
  end
end
