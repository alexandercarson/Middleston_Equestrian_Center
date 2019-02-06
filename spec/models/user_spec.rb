require 'rails_helper'

describe User do
  it { should have_valid(:name).when('name') }
  it { should have_valid(:email).when('email@email.com') }
  it { should have_valid(:phone_number).when('123-456-7890') }
  it { should have_valid(:address).when('address') }
  it { should have_valid(:city).when('city') }
  it { should have_valid(:state).when('state') }
  it { should have_valid(:zip_code).when('68506') }

  it { should_not have_valid(:name).when(nil, '') }
  it { should_not have_valid(:email).when(nil, '', 'user', 'user.com', 'user@email') }
  it { should_not have_valid(:phone_number).when(nil, '') }
  it { should_not have_valid(:address).when(nil, '') }
  it { should_not have_valid(:city).when(nil, '') }
  it { should_not have_valid(:state).when(nil, '') }
  it { should_not have_valid(:zip_code).when(nil, '') }

end

RSpec.describe User do
  context 'making a new user' do
    let(:user) {User.new(name: 'John Doe', email: 'email@email.com', phone_number: '123-456-7890', address: '123 Main St', city: 'Lincoln', state: 'Nebraska', zip_code: '68506')}

    it 'has a name' do
      expect(user.name).to include('John Doe')
    end

    it 'has a valid email' do
      expect(user.email).to include('email@email.com')
    end

    it 'has a phone_number' do
      expect(user.phone_number).to include('123-456-7890')
    end

    it 'has a address' do
      expect(user.address).to include('123 Main St')
    end

    it 'has a city' do
      expect(user.city).to include('Lincoln')
    end

    it 'has a state' do
      expect(user.state).to include('Nebraska')
    end

    it 'has a zip_code' do
      expect(user.zip_code).to include('68506')
    end
  end

  it 'has a matching password confirmation for the password' do
    user = User.new
    user.password = 'password'
    user.password_confirmation = 'anotherpassword'

    expect(user).to_not be_valid
    expect(user.errors[:password_confirmation]).to_not be_blank
  end

    describe "#admin?" do
    it "is not an admin if the role is not admin" do
      user = FactoryBot.create(:user, email: 'test@email.com', role: "member")
      expect(user.admin?).to eq(false)
    end

    it "is an admin if the role is admin" do
      user = FactoryBot.create(:user, email: 'test2@email.com', role: "admin")
      expect(user.admin?).to eq(true)
    end
  end
end
