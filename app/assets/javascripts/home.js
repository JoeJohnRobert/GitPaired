$(function(){

  $('ol').on('click', 'li', function(){
    $(this).find('.fa').toggleClass('blue');
  })

});