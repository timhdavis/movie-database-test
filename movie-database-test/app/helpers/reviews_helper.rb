module ReviewsHelper
    def maxRating
        return Review.max_rating
    end
end
