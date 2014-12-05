$(function(){
//it should start grey if true it should start ble

  $('ol').on('click', 'li', function(){
    $(this).find('.fa').toggleClass('blue');
  })

});