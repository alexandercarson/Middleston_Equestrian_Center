class Problem < ApplicationRecord

    belongs_to :horse
    belongs_to :user

    validates :horse, presence: true
    validates :date, presence: true
    validates :description, presence: true
    validates :time, presence: true
    validates :user_id, presence: true









  end
