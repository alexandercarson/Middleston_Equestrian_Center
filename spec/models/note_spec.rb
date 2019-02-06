require 'rails_helper'

describe Note do
  it { should have_valid(:text).when('a whole bunch of words') }
  it { should have_valid(:horse_id).when(1, 20, 300) }

  it { should_not have_valid(:text).when(nil, '', 'good', 'good ride') }
end

RSpec.describe Note do
  context 'making a new note' do
    let(:note) {Note.new(horse_id: 1, text: 'I am a proper note!')}

    it 'has a horse_id' do
      expect(note.horse_id).to eq(1)
    end

    it 'has a text' do
      expect(note.text).to include('I am a proper note!')
    end
  end
end
