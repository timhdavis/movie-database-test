class MoviesController < ApplicationController
  def index
  end

  def show

    if (params[:id].present?)
      @movie = Movie.find(params[:id])
      redirect_to @movie
    elsif (params[:api_movie_id].present?)
      @api_movie_id = params[:api_movie_id];
    end

    
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


end
