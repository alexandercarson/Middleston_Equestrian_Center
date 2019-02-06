FactoryBot.define do
  factory :horse do |f|
      f.user {''}
      f.veterinarian {''}
      f.farrier {''}
      f.barn_name { Faker::Space.meteorite }
      f.registered_name { Faker::Space.star_cluster }
      f.breed  { Faker::Pokemon.name }
      f.discipline { Faker::Pokemon.move }
    end
  end
