/*
# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
*/

// jQeury:
$(function(){

    var $movies_ul = $('#movies');

    $.ajax({
        type: 'GET',
        url: 'https://api.themoviedb.org/3/movie/now_playing?page=1&api_key=3ef6eb2432d3b79bfdb2b5bd0702e803',
        success: function(data) {
            console.log('success', data);
            
            var movies = data.results;

            $.each(movies, function(i, movie) {
                // console.log("i=" + i + ", movie.title= " + movie.title);

                $movies_ul.append('<li>title: ' + movie.title + '</li>');
            });
        }
    });
});