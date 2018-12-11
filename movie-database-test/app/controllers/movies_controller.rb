class MoviesController < ApplicationController
  def index
  end

  def show
    @api_movie_id = params[:api_movie_id];
  end
end
