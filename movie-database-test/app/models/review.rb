class Review < ApplicationRecord
  # Relationships:
  belongs_to :movie
  belongs_to :user

  # Required fields:
  validates :rating, presence: true
  validates :rating, inclusion: 1..5
  validates :email, presence: true

  # Other methods:

  def self.max_rating
    return 5
  end

  def self.min_rating
    return 1
  end

end
