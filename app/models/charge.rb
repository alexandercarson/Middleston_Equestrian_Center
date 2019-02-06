class Charge < ApplicationRecord
  belongs_to :horse

  validates :date, presence: true
  validates :description, presence: true
  validates :amount, presence: true, numericality: true
end
