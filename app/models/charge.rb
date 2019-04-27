class Charge < ApplicationRecord
    has_and_belongs_to_many :horses
    belongs_to :user
end
