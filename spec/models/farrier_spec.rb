require 'rails_helper'

describe Farrier do
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

RSpec.describe Farrier do
  context 'making a new farrier' do
    let(:farrier) {Farrier.new(name: 'John Doe', phone_number: '123-456-7890', address: '123 Main St', city: 'Lincoln', state: 'Nebraska', zip_code: '68506')}

    it 'has a name' do
      expect(farrier.name).to include('John Doe')
    end

    it 'has a phone_number' do
      expect(farrier.phone_number).to include('123-456-7890')
    end

    it 'has a address' do
      expect(farrier.address).to include('123 Main St')
    end

    it 'has a city' do
      expect(farrier.city).to include('Lincoln')
    end

    it 'has a state' do
      expect(farrier.state).to include('Nebraska')
    end

    it 'has a zip_code' do
      expect(farrier.zip_code).to include('68506')
    end
  end
end
