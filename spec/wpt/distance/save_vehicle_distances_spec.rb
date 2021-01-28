# frozen_string_literal: true

require './wpt/wpt'
require './wpt/distance/save_vehicle_distances'

describe WPT::Distance::SaveVehicleDistance do
  context 'when data are correct' do
    subject { described_class.new(answer, created) }

    let(:answer) { { vehicle_type: vehicle_type, line: line, stop_id: stop_id } }
    let(:vehicle_type) { 2 }
    let(:line) { 22 }
    let(:stop_id) { 33 }
    let(:created) { Time.new.to_i }
    let(:fetched_vehicles) { YAML.load_file('spec/fixtures/wpt/distances/vehicles_distances.yaml') }
    let(:vehicle_number) { '1413+1414' }

    before do
      allow_any_instance_of(WPT::API::FetchVehicleData).to receive(:fetch).and_return(fetched_vehicles)
    end

    it 'add new record to table `distances`' do
      subject.call

      db = DB::SQL::Base.new(line, vehicle_number, created)
      db.query = 'SELECT distance FROM distances WHERE line = ? and vehicle_number = ? and created = ?;'
      result = db.execute

      expect(result.first.first).to eq(5.048782374756628)
    end
  end
end
