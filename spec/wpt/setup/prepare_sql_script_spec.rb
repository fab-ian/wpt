# frozen_string_literal: true

require './wpt/wpt'
require './wpt/setup/prepare_sql_script'

describe WPT::Setup::PrepareSqlScript do
  context 'whem proper data given' do
    subject { described_class.new(stops) }
    let(:stops) { YAML.load_file('spec/fixtures/wpt/setup/stops.yaml') }
    let(:expected_file) { File.read('spec/fixtures/wpt/setup/create_tables_and_import_data_expect.sql') }
    let(:generated_file_path) { 'spec/fixtures/wpt/setup/create_tables_and_import_data.sql' }

    after do
      File.delete(generated_file_path)
    end

    it 'generate sql script' do
      subject.call
      file_generated = File.read(generated_file_path)

      expect(expected_file).to match(file_generated)
    end
  end
end
