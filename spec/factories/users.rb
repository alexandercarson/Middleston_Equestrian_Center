FactoryBot.define do
  factory :user do |f|
      f.email { Faker::Internet.email }
      f.name { Faker::Pokemon.name }
      f.phone_number { Faker::Internet.ip_v4_address }
      f.address { Faker::Address.street_address }
      f.city { Faker::Address.city }
      f.state { Faker::Address.state }
      f.zip_code {'68506'}
      f.password {'password'}
      f.password_confirmation {'password'}
      f.role {'admin'}
    end
  end
