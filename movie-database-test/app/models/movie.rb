class Movie < ApplicationRecord
    # Relationships:
    has_many :reviews

    # Required fields:
    validates :api_id, presence: true

    # Other methods:

    def calculated_average_rating
        # Return 0 if no reviews yet:
        return 0 if self.reviews.empty?

        self.average_rating = 0

        sum = 0

        self.reviews.each do |review|
            sum += review.rating.to_i
        end
        
        # Return the average score of all ratings:
        return (sum.to_f / self.reviews.size.to_f).round(2) # Round to 2 decimal places.
    end

end
