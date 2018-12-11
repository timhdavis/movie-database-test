class User < ApplicationRecord
    # Relationships:
    has_many :reviews

    # Required fields:
    validates :email, presence: true
end
