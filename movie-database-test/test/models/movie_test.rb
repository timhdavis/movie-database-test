require 'test_helper'

class MovieTest < ActiveSupport::TestCase
  def setup
    @movie = movies(:valid_movie_1)
  end

  test "valid movie" do
    assert @movie.valid?
  end

  test "invalid movie without api_id" do
    @movie.api_id = nil
    refute @movie.valid?, 'saved movie without api_id'
    assert_not_nil @movie.errors[:name], 'no validation error for api_id present'
  end

  # Test associations:

  test "#reviews" do
    assert_equal 2, @movie.reviews.size
  end

  # Other Tests:

  test "calculate movie correct average rating" do
    average = @movie.calculated_average_rating

    assert_equal 3, average
  end

  test "calculate movie without reviews average rating" do
    movie = movies(:valid_movie_without_reviews)

    average = movie.calculated_average_rating

    assert_equal 0, average    
  end


end
