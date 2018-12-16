# Movie Database Project
This project is a simple web application for rating movies.

### The project is deployed on [Heroku](https://www.heroku.com):

https://movie-database-test.herokuapp.com (view app live)


#### The movies in this project are produced from an API call to *The Movie Database (TMDb)*:

https://www.themoviedb.org/documentation/api?language=en

#### Features include:
- Viewing movies ([now playing movies from TMDb](https://developers.themoviedb.org/3/movies/get-now-playing)).
- Sorting the movie list by Title, Release Date, or Genre.
- Viewing movie details.
- Viewing all reviews for a movie.
- Adding a review for a movie.
  - Reviews include an email address, rating (1 through 5), and an optional comment.
- Viewing all Reviews.
- Viewing recent reviews (on the Home page).
- Viewing recently rated movies (on the Home page).

#### Running tests:

Minitest is used for testing.

Acceptance testing uses Capybara and Selenium ([chromedriver](http://chromedriver.chromium.org/)).

To get chromedriver using Homebrew:

- run `brew tap homebrew/cask` then `brew cask install chromedriver`

**To run the tests, run `rails test`**

