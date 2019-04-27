class Problem < ApplicationRecord

    belongs_to :horse

    validates :horse, presence: true
    validates :date, presence: true
    validates :description, presence: true
    validates :time, presence: true









  end
