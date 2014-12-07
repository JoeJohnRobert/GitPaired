// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready(function() {
  $('.proj-hover').hover(
  function() {
    // debugger;
    $(this).find('button').append( $( "<span class='proj-hover'> Want a collaborator?</span>" ) );
  }, function() {
    $(this).find('button').find( "span:last" ).remove();
  }
);
 

});


// $('i').hover(
//   function() {
//     debugger;
//     $( 'button').append( $( "<span> Open this project for colllaboration!</span>" ) );
//   }, function() {
//     $( 'button' ).find( "span:last" ).remove();
//   }
// );