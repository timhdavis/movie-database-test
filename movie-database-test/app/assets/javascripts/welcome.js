/*
# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
*/

function jsRoar(name) {
    alert(`I am ${name}, hear me roar!`)
}

$(function(){
    $("p").click(function(){
        $(this).hide();
    });
});