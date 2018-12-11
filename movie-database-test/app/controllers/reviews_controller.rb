class ReviewsController < ApplicationController
  def index
    @reiviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
  end

  def new
    @review = Review.new
  end

  def create
    @movie = Movie.find(params[:movie_id])
    @review = @movie.reviews.create(review_params)

    redirect_to movie_path(@movie)
  end


  private

  def review_params
    params.require(:review).permit(:rating, :comment, :movie_id, :user_id)
  end
end
