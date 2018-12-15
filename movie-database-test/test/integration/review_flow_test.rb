require 'test_helper'

class ReviewFlowTest < Capybara::Rails::TestCase
  def setup
    @review_1 = reviews(:valid_review_1)
    @review_2 = reviews(:valid_review_2)
  end

  test 'review index' do
    visit reviews_path

    assert page.has_content?(@review_1.email)
    assert page.has_content?(@review_1.email)
  end

  test 'writing a new review' do
    movie = movies(:valid_movie_1)
    visit movie_path(movie)

    email = 'test_email_add_review_1@email.com'
    comment = 'Test Comment'

    fill_in 'Email', with: email
    fill_in 'Comment',  with: comment

    select_star(2)

    click_on 'Add Review'

    assert_current_path movie_path(movie)
    assert page.has_content?(email)
    assert page.has_content?(comment)
  end

  test 'writing a new review with min rating' do
    movie = movies(:valid_movie_1)
    visit movie_path(movie)

    email = 'test_email_add_review_min@email.com'
    comment = 'Test Comment Min'

    fill_in 'Email', with: email
    fill_in 'Comment',  with: comment

    select_star(1)

    click_on 'Add Review'

    assert_current_path movie_path(movie)
    assert page.has_content?(email)
    assert page.has_content?(comment)
  end

  test 'writing a new review with max rating' do
    movie = movies(:valid_movie_1)
    visit movie_path(movie)

    email = 'test_email_add_review_max@email.com'
    comment = 'Test Comment Max'

    fill_in 'Email', with: email
    fill_in 'Comment',  with: comment

    select_star(5)

    click_on 'Add Review'

    assert_current_path movie_path(movie)
    assert page.has_content?(email)
    assert page.has_content?(comment)
  end

  test 'writing a new review without rating' do
    movie = movies(:valid_movie_1)
    visit movie_path(movie)

    email = 'test_email_add_review_2@email.com'
    comment = 'Test Comment 2'

    fill_in 'Email', with: email
    fill_in 'Comment',  with: comment

    # Without adding rating.

    click_on 'Add Review'

    assert_current_path movie_path(movie)
    assert page.has_content?("Rating is not included in the list")
  end

  test 'writing a new review without email' do
    movie = movies(:valid_movie_1)
    visit movie_path(movie)

    fill_in 'Comment',  with: 'Test Comment 3'

    # Use jQuery to select Raty star rating in form:
    select_star(3)

    click_on 'Add Review'

    assert_current_path movie_path(movie)
    assert page.has_content?("Email can't be blank")
  end

  private

  def select_star(star_rating)
    # Use jQuery to select the Raty star rating in form:

    within ("#rating-form") do
      # Each Raty star image has alt={1..5 depending on star order}:
      page.find(:css, "img[alt='#{star_rating.to_s}']").click
    end
  end

end