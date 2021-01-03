# frozen_string_literal: true

require './wpt'

describe WPT::Start do
  it 'say Hello' do
    expect(described_class.new.say_hello).to eq('Hello World')
  end
end
