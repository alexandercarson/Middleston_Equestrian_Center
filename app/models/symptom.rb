class Symptom < ApplicationRecord
    belongs_to :horse
    has_many :problems
end

