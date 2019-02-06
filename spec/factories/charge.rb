FactoryBot.define do
  factory :charge do |f|
    f.date { '' }
    f.horse { '' }
    f.amount { Faker::Number.decimal(2) }
    f.description { Faker::ChuckNorris.fact }
  end
end
