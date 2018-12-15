class User < ApplicationRecord
    # Relationships:
    has_many :reviews

    # Required fields:
    validates :email, presence: true

    # Other methods:

    # Return an existing user, if exists, or create a new one:
    def self.find_or_create(email)
        user = User.find_by_email(email)

        # If no user with this email in the database:
        if (!user)
            user = User.create(email: email)
        end

        return user
    end
end
