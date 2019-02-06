require 'rails_helper'

describe Veterinarian do
  it { should have_valid(:name).when('name') }
  it { should have_valid(:phone_number).when('123-456-7890') }
  it { should have_valid(:address).when('address') }
  it { should have_valid(:city).when('city') }
  it { should have_valid(:state).when('state') }
  it { should have_valid(:zip_code).when('68506') }

  it { should_not have_valid(:name).when(nil, '') }
  it { should_not have_valid(:phone_number).when(nil, '') }
  it { should_not have_valid(:address).when(nil, '') }
  it { should_not have_valid(:city).when(nil, '') }
  it { should_not have_valid(:state).when(nil, '') }
  it { should_not have_valid(:zip_code).when(nil, '') }
end

RSpec.describe Veterinarian do
  context 'making a new veterinarian' do
    let(:veterinarian) {Veterinarian.new(name: 'John Doe', phone_number: '123-456-7890', address: '123 Main St', city: 'Lincoln', state: 'Nebraska', zip_code: '68506')}

    it 'has a name' do
      expect(veterinarian.name).to include('John Doe')
    end

    it 'has a phone_number' do
      expect(veterinarian.phone_number).to include('123-456-7890')
    end

    it 'has a address' do
      expect(veterinarian.address).to include('123 Main St')
    end

    it 'has a city' do
      expect(veterinarian.city).to include('Lincoln')
    end

    it 'has a state' do
      expect(veterinarian.state).to include('Nebraska')
    end

    it 'has a zip_code' do
      expect(veterinarian.zip_code).to include('68506')
    end
  end
end
