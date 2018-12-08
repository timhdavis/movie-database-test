/*
# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
*/

$(function(){

    //var $users_ul = $('#users');

    // TEST:
    // $.ajax({
    //     type: 'GET',
    //     url: 'https://jsonplaceholder.typicode.com/users',
    //     success: function(users) {
    //         console.log('success', users);

    //         $.each(users, function(i, user) {
    //             console.log("i=" + i + ", user.id=" + user.id + ", user.name=" + user.name);

    //             $users_ul.append('<li>id: ' + user.id + ', name: ' + user.name + '</li>');
    //         });
    //     }
    // });

    var $movies_ul = $('#movies');

    $.ajax({
        type: 'GET',
        url: 'https://api.themoviedb.org/3/movie/now_playing?page=1&api_key=3ef6eb2432d3b79bfdb2b5bd0702e803',
        success: function(data) {
            console.log('success', data);
            
            var movies = data.results;

            $.each(movies, function(i, movie) {
                console.log("i=" + i + ", movie.title= " + movie.title);

                $movies_ul.append('<li>title: ' + movie.title + '</li>');
            });
        }
    });
});