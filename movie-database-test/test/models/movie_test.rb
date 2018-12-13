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


end
