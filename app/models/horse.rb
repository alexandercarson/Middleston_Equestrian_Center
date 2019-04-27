class Horse < ApplicationRecord

  belongs_to :user
  belongs_to :veterinarian
  belongs_to :farrier
  has_many :problems
  has_many :medications
  has_many :notes
  has_many :coggins

  mount_uploader :picture, PictureUploader

  validates :barn_name, presence: true
  validates :breed, presence: true
  validates :user_id, presence: true
  validates :veterinarian_id, presence: true
  validates :farrier_id, presence: true
end
