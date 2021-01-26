# frozen_string_literal: true

require 'tty/prompt/test'
require './wpt/wpt'
require './wpt/views/define_stop'

describe WPT::Views::DefineStop do
  let(:prompt) { TTY::Prompt::Test.new }
  subject { described_class.new(prompt) }

  before do
    prompt.on :keypress do |e|
      prompt.trigger :keyup   if e.value == 'k'
      prompt.trigger :keydown if e.value == 'j'
    end
  end

  context 'when stop exist' do
    it 'return stop name Kijowska' do
      prompt.input << 'kij' << "\n" << 'j' << "\n"
      prompt.input.rewind
      subject.call

      expect(prompt.output.string).to match(/Kijowska/)
    end
  end

  context 'when stop does not exist' do
    it 'returns exeption' do
      prompt.input << 'kijjjjj' << "\n" << 'j' << "\n"
      prompt.input.rewind

      expect(subject.call).to include(error: 'NoStopFounds')
    end
  end
end
