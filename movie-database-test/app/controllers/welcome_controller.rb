class WelcomeController < ApplicationController
  def index
    @page = 'home'

    @reviews = Review.recent

    @movies = Array.new

    @reviews.each do |review|
      if (!@movies.include?(review.movie))
        @movies.push(review.movie)
        puts "Adding movie: #{review.movie.id} to @movies"
      end
    end
  end

  def about
    @page = 'about'
  end
end
