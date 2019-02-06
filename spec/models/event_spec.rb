require 'rails_helper'

describe Event do
  it { should have_valid(:date).when('2017/09/01') }
  it { should have_valid(:description).when('description') }
  it { should have_valid(:horse_id).when(1, 20, 300) }

  it { should_not have_valid(:date).when(nil, '') }
  it { should_not have_valid(:description).when(nil, '') }
end

RSpec.describe Event do
  context 'making a new charge' do
    let(:event) {Event.new(date: Date.current, description: 'description', horse_id: 1)}

    it 'has a date' do
      expect(event.date).to eq(Date.current)
    end

    it 'has a description' do
      expect(event.description).to include('description')
    end

    it 'has a horse_id' do
      expect(event.horse_id).to eq(1)
    end
  end
end
