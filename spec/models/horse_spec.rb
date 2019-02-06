require 'rails_helper'

describe Horse do
  it { should have_valid(:barn_name).when('barn_name') }
  it { should have_valid(:registered_name).when('registered name') }
  it { should have_valid(:breed).when('breed') }
  it { should have_valid(:discipline).when('discipline') }
  it { should have_valid(:user_id).when(1, 20, 300) }
  it { should have_valid(:veterinarian_id).when(1, 20, 300) }
  it { should have_valid(:farrier_id).when(1, 20, 300) }

  it { should_not have_valid(:barn_name).when(nil, '') }
  it { should_not have_valid(:breed).when(nil, '') }
  it { should_not have_valid(:user_id).when(nil, '') }
  it { should_not have_valid(:veterinarian_id).when(nil, '') }
  it { should_not have_valid(:farrier_id).when(nil, '') }
end

RSpec.describe Horse do
  context 'making a new horse' do
    let(:horse) { Horse.new(registered_name: 'RA Kasanova', barn_name: 'Kas', breed: 'Arabian', discipline: 'Western', user_id: 1, veterinarian_id: 1, farrier_id: 1) }

    it 'has a registered_name' do
      expect(horse.registered_name).to include('RA Kasanova')
    end

    it 'has a barn_name' do
      expect(horse.barn_name).to include('Kas')
    end

    it 'has a breed' do
      expect(horse.breed).to include('Arabian')
    end

    it 'has a discipline' do
      expect(horse.discipline).to include('Western')
    end

    it 'has a user' do
      expect(horse.user_id).to eq(1)
    end

    it 'has a veterinarian' do
      expect(horse.veterinarian_id).to eq(1)
    end

    it 'has a farrier' do
      expect(horse.farrier_id).to eq(1)
    end
  end
end
