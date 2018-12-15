require 'test_helper'

class MoviesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @movie = movies(:valid_movie_1)
  end
  
  test "should get index" do
    get movies_path
    assert_response :success
  end

  test "should get show" do
    get movie_path(@movie)
    assert_response :success
  end

end
