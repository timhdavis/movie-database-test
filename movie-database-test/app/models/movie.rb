class Movie < ApplicationRecord
    # Relationships:
    has_many :reviews

    # Required fields:
    validates :api_id, presence: true
    validates :year, presence: true
end
