/*
# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
*/

$(function(){

    var $users_ul = $('#users');

    $.ajax({
        type: 'GET',
        url: 'https://jsonplaceholder.typicode.com/users',
        success: function(users) {
            console.log('success', users);

            $.each(users, function(i, user) {
                console.log("i=" + i + ", user.id=" + user.id + ", user.name=" + user.name);

                $users_ul.append('<li>id: ' + user.id + ', name: ' + user.name + '</li>');
            });
        }
    });
});