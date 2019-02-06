FactoryBot.define do
  factory :farrier do |f|
    f.name { Faker::Name.name }
    f.phone_number { Faker::Internet.ip_v4_address }
    f.address { Faker::Address.street_address }
    f.city { Faker::Address.city }
    f.state { Faker::Address.state }
    f.zip_code { Faker::Address.building_number }
  end
end
