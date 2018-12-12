class MoviesController < ApplicationController
  def index
  end

  def show

    if (params[:id].present?)
      @movie = Movie.find(params[:id])
    elsif (params[:api_movie_id].present?)
      @movie = Movie.find_by_api_id(params[:api_movie_id])

      if (!@movie) # Movie not in DB yet:
        @movie = Movie.create(api_id: params[:api_movie_id], title: params[:title], 
          release_date: params[:release_date], genre: params[:genre], img_path: params[:img_path])
        
        puts("NEW Movie created from api_movie_id = " + params[:api_movie_id])
      end

      @api_movie_id = params[:api_movie_id];
    end

    @movie.average_rating = get_updated_average_rating(@movie)

    @review = Review.new
    
  end

  # Called when the New Movie form is submitted:
  def create
    # Create a new movie instance that will be used in the form:
    @movie = Movie.new(movie_params);

    if(@movie.save)
        # Present a 1-time flash message to the user after redirect:
        flash[:notice] = "Movie created successfully.";

        # If saved to DB successfully, go to show page:
        redirect_to @movie;
    else
        # If validations prevented save, reload form (with error message):
        render 'new'; # TODO: change...
    end
  end


  private

  def movie_params
    params.require(:review).permit(:api_id)
  end

  def get_updated_average_rating(movie)
    # Return 0 if no reviews yet:
    return 0 if movie.reviews.empty?

    movie.average_rating = 0

    sum = 0

    movie.reviews.each do |review|
      sum += review.rating.to_i
    end

    # Return the average score of all ratings:
    return (sum.to_f / movie.reviews.size.to_f).round(2) # Round to 2 decimal places.
  end

end
