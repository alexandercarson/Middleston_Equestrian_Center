class Coggin < ApplicationRecord
  belongs_to :horse
  
  mount_uploader :coggin, CogginUploader # Tells rails to use this uploader for this model.
  validates :coggin, presence: true

  end
