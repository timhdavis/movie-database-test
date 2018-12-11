class Review < ApplicationRecord
  # Relationships:
  belongs_to :movie
  belongs_to :user

  # Required fields:
  validates :rating, presence: true
end
