/*
# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
*/

// jQeury:
$(function(){

    var $movieList = $('#movie-list');
    var $movies;
    var $genres = [];

    var getMovieHTML = function(movie) {

        console.log("$genres[0]", $genres[0]);
        console.log("movie.genres[0]", movie.genre_ids[0]);

        

        var html = `<li class="card">
            <img class="card-img-left" src="" alt="Card image cap">
            <div class="card-body">
                <h5 class="card-title">Movie title: ${movie.title}</h5>
                <h5 class="card-title">Release Date: ${movie.release_date}</h5>
                <h5 class="card-title">Genre: ${getMainGenre(movie).name}</h5>
                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                <a href="#" class="btn btn-primary">Add Review</a>
            </div>
        </li>`;

        return html;
    }

    // Returns the name of the first genre in the movie's genre list:
    var getMainGenre = function(movie) {
        return $genres.find(g => g.id === movie.genre_ids[0]);
    }

    var sortByTitle = function(movies) {
        // Compare by title alphabetically (ascending):
        movies.sort(function(m1, m2) {return m1.title > m2.title ? 1 : -1;});

        console.log(movies);

        return movies;
    }

    var sortByReleaseDate = function(movies) {
        // Compare by release date (newest first):
        movies.sort(function(m1, m2) {return m1.release_date < m2.release_date ? 1 : -1;});

        console.log(movies);

        return movies;
    }

    var sortByGenre = function(movies) {
        // Compare by genre alphabetically (ascending):
        movies.sort(function(m1, m2) {return getMainGenre(m1).name > getMainGenre(m2).name ? 1 : -1;});

        console.log(movies);

        return movies;
    }

    // NOTE: This is not part of the requirements:
    var sortByRatingAscending = function(movies) {
        movies.sort(function(m1, m2) {return m1.vote_average - m2.vote_average});

        console.log(movies);

        return movies;
    }

    // Get Genres:
    $.ajax({
        type: 'GET',
        url: 'https://api.themoviedb.org/3/genre/movie/list?language=en-US&api_key=3ef6eb2432d3b79bfdb2b5bd0702e803',
        success: function(data) {
            console.log('success', data);
            
            $genres = [];

            $.each(data.genres, function(i, genre) {
                console.log("i=" + i + ", genre.name= " + genre.name);

                $genres.push(genre);

                //console.log("$genres = " + $genres);
            });
        }
    });

    // Get Movies (Now Playing):
    var reloadMovieView = function() {
        
        $movieList.empty();

        $.each($movies, function(i, movie) {
            console.log("i=" + i + ", movie.title= " + movie.title);

            // $movieTemplate.append(Mustache.render(movieTemplate, movie));
            // $movieList.append('<li>title: ' + movie.title + '</li>');
            $movieList.append(getMovieHTML(movie));
        });
    }

    $.ajax({
        type: 'GET',
        url: 'https://api.themoviedb.org/3/movie/now_playing?page=1&api_key=3ef6eb2432d3b79bfdb2b5bd0702e803',
        success: function(data) {
            console.log('success', data);
            
            $movies = sortByTitle(data.results);
            
            reloadMovieView();
        }
    });

    // Sort button group:

    $('#sort-by-title').click(function() {
        console.log("Sorting by Title");

        if ($movies) {
            sortByTitle($movies);
            reloadMovieView();
        }
    });

    $('#sort-by-date').click(function() {
        console.log("Sorting by Date");

        if ($movies) {
            sortByReleaseDate($movies);
            reloadMovieView();
        }
    });

    $('#sort-by-genre').click(function() {
        console.log("Sorting by Genre");

        if ($movies) {
            sortByGenre($movies);
            reloadMovieView();
        }
    });
    
});