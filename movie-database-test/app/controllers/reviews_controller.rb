class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
  end

  def new
    @review = Review.new

    if (params[:movie_id].present?)
      #Set movie_id in review:
      movie = Movie.find(params[:movie_id])

      puts("EXISTING Movie found from movie_id = " + movie.id)
      
    elsif (params[:api_movie_id].present?)
      #Create a new Movie in DB, then set movie_id in review:
      # Check if movie with this api_id is already in the DB:
      movie = Movie.find_by_api_id(params[:api_movie_id])
      
      if (movie)
        puts("EXISTING Movie found from api_movie_id = " + params[:api_movie_id])
      end

      if (!movie) # Movie not in DB yet:
        movie = Movie.create(api_id: params[:api_movie_id])
        puts("NEW Movie created from api_movie_id = " + params[:api_movie_id])
      end

    else
      #TODO: redirect to Home with flash: "Can only review a valid movie / Movie not found"
      # TODO.....
      flash[:alert] = "No movie selected.";
      redirect_to root_path and return
    end

    @review.movie_id = movie.id

  end

  # Called when the New Review form is submitted:
  def create

    puts("params[:movie_id] = #{params[:movie_id]}")

    # Create a new review instance that will be used in the form:
    @review = Review.new(review_params);

    # DEBUG ONLY:
    puts("review_params[:email] = #{review_params[:email]}")
    @review.user = User.get(review_params[:email]);

    @review.movie = Movie.find(params[:movie_id])

    if(@review.save)
        # Present a 1-time flash message to the user after redirect:
        flash[:notice] = "Review created successfully.";

        # If saved to DB successfully, go to show page:
        redirect_to @review.movie;
    else
        # If validations prevented save, reload form (with error message):
        flash[:alert] = "Failed to add\n";
        @review.errors.full_messages.each do |error_message|
          flash[:alert] = "#{error_message}\n";
        end

        redirect_to movie_path(params[:movie_id])
    end
  end


  private

  def review_params
    params.require(:review).permit(:rating, :comment, :movie_id, :user_id, :email)
  end
end
