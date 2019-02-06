class Farrier < ApplicationRecord
  has_many :horses

  validates :name, presence: true
  validates :phone_number, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip_code, presence: true, numericality: true
  
end
