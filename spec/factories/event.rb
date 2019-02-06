FactoryBot.define do
  factory :event do |f|
    f.date { '' }
    f.horse { '' }
    f.time { '4:30' }
    f.description { Faker::ChuckNorris.fact }
    f.notes { Faker::Hacker.say_something_smart }
  end
end
