# Schema:
# create_table "reviews", force: :cascade do |t|
#   t.integer "rating"
#   t.text "comment"
#   t.integer "movie_id"
#   t.integer "user_id"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
#   t.string "email"
#   t.index ["movie_id"], name: "index_reviews_on_movie_id"
#   t.index ["user_id"], name: "index_reviews_on_user_id"
# end

require 'test_helper'

class ReviewTest < ActiveSupport::TestCase
  def setup
    @review = reviews(:valid_review_1)
    @min_rating = 1
    @max_rating = 5
  end

  test "valid review" do
    assert @review.valid?
  end

  # Test required fields:

  test "invalid review without email" do
    @review.email = nil
    refute @review.valid?, 'saved review without email'
    assert_not_nil @review.errors[:name], 'no validation error for email present'
  end

  test "invalid review without rating" do
    @review.rating = nil
    refute @review.valid?, 'saved review without rating'
    assert_not_nil @review.errors[:name], 'no validation error for rating present'
  end

  test "invalid review without user" do
    @review.user = nil
    refute @review.valid?, 'saved review without user'
    assert_not_nil @review.errors[:name], 'no validation error for user present'
  end

  test "invalid review without movie" do
    @review.movie = nil
    refute @review.valid?, 'saved review without movie'
    assert_not_nil @review.errors[:name], 'no validation error for movie present'
  end

  # Test Review.rating valid range:

  test "invalid review with rating below min" do
    @review.rating = (@min_rating - 1)
    refute @review.valid?, "saved review with rating < #{@min_rating}"
    assert_not_nil @review.errors[:name], "no validation error for rating below #{@min_rating}"
  end

  test "invalid review with rating above max" do
    @review.rating = (@max_rating + 1)
    refute @review.valid?, "saved review with rating > #{@max_rating}"
    assert_not_nil @review.errors[:name], "no validation error for rating above #{@max_rating}"
  end

end
