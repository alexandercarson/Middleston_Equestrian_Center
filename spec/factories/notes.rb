FactoryBot.define do
  factory :note do |f|
    f.horse { '' }
    f.text { Faker::Hacker.say_something_smart }
  end
end
