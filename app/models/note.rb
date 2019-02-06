class Note < ApplicationRecord
  belongs_to :horse
  
  validates :text,
  presence: true,
  length: { minimum: 10, maximum: 2000 }

end
