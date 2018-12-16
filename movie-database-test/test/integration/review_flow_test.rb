require 'test_helper'

class ReviewFlowTest < Capybara::Rails::TestCase
  def setup
    @movie = movies(:valid_movie_1)
    @review_1 = reviews(:valid_review_1)
    @review_2 = reviews(:valid_review_2)

    @success_message = "Review created successfully."
  end

  test 'review index' do
    visit reviews_path

    assert page.has_content?(@review_1.email)
    assert page.has_content?(@review_1.email)
  end

  # Test add review success:

  test 'writing a new review' do
    visit movie_path(@movie)

    email = 'test_email_add_review_1@email.com'
    comment = 'Test Comment'
    star_rating = 2

    test_add_review(email, comment, star_rating)

    assert_current_path movie_path(@movie)
    assert page.has_content?(@success_message)
    assert page.has_content?(email)
    assert page.has_content?(comment)
  end


  # Test min and max rating:

  test 'writing a new review with min rating' do
    visit movie_path(@movie)
    
    email = 'test_email_add_review_min@email.com'
    comment = 'Test Comment Min'
    star_rating = 2

    test_add_review(email, comment, star_rating)

    assert_current_path movie_path(@movie)
    assert page.has_content?(email)
    assert page.has_content?(comment)
  end


  test 'writing a new review with below min rating' do
    visit movie_path(@movie)
    
    email = 'test_email_add_review_below_min@email.com'
    comment = 'Test Comment Below Min'
    star_rating = 0

    test_add_review(email, comment, star_rating)

    assert_current_path movie_path(@movie)
    assert page.has_no_content?(@success_message) # Assert failed to add.
  end


  test 'writing a new review with max rating' do
    visit movie_path(@movie)
    
    email = 'test_email_add_review_max@email.com'
    comment = 'Test Comment Max'
    star_rating = 5

    test_add_review(email, comment, star_rating)

    assert_current_path movie_path(@movie)
    assert page.has_content?(email)
    assert page.has_content?(comment)
  end

  test 'writing a new review with above max rating' do
    visit movie_path(@movie)
    
    email = 'test_email_add_review_above_max@email.com'
    comment = 'Test Comment Above Max'
    star_rating = 6

    test_add_review(email, comment, star_rating)

    assert_current_path movie_path(@movie)
    assert page.has_no_content?(@success_message) # Assert failed to add.
  end


  # Test with missing fields:

  test 'writing a new review without rating' do
    visit movie_path(@movie)
    
    email = 'test_email_add_review_2@email.com'
    comment = 'Test Comment 2'
    star_rating = nil

    test_add_review(email, comment, star_rating)

    assert_current_path movie_path(@movie)
    assert page.has_content?("Rating is not included in the list")
  end


  test 'writing a new review without email' do
    visit movie_path(@movie)
    
    email = nil
    comment = 'Test Comment 2'
    star_rating = 3

    test_add_review(email, comment, star_rating)

    assert_current_path movie_path(@movie)
    assert page.has_content?("Email can't be blank")
  end



  private

  def select_star(star_rating)
    # # Use jQuery to select the Raty star rating in form:

    # within ("#rating-form") do
    #   # Each Raty star image has alt={1..5 depending on star order}:
    #   page.find(:css, "img[alt='#{star_rating.to_s}']").click
    # end

    fill_in "Rating",	with: star_rating 
  end

  # Fills in the review fields and clicks "Add Review":
  def test_add_review(email, comment, star_rating)
    if (email)
      fill_in 'Email', with: email
    end

    if (comment)
      fill_in 'Comment',  with: comment
    end
    
    if (star_rating)
      select_star(star_rating)
    end

    click_on 'Add Review'
  end

end