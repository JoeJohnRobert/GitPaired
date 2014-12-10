// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready(function() {

  $('.project-item').hover(function(){
    // this.children[0].children[0].style.visibility = 'hidden';
    // this.children[1].children[0].style.visibility = 'hidden';
  });

  $('.project-item').mouseleave(function(){
    // this.children[0].children[0].style.visibility = 'visible';
    // this.children[1].children[0].style.visibility = 'visible';
  });
  

  $('.proj-hover').hover(
  function() {
    $(this).find('.button-collab').find('button').append( $( "<span class='proj-hover'> Want a collaborator?</span>" ) );
  }, function() {
    $(this).find('.button-collab').find('button').find( "span:last" ).remove();
  });

   
  var modal = $('.modal[aria-hidden=false]');
  $('.modal-btn').click(function(){
    $(window).scrollTop(800);
  })


  $('.project-details h3').siblings().hide();

  $('.project-details').hover(function(){
    $(this).children('ul').show();
  }, function(){
    $(this).children('ul').hide();
    }
  )

  $('.yelp-info').hide();
  $('.yelp-details').hide();


  $('.email-button').hover(function(){
    $(this).siblings('.yelp-info').slideDown(300);
  }, function(){
    $(this).parent().mouseleave(function() {
      $('.yelp-info').slideUp();
    });
  })

  $('.yelp-image').hover(function(){
    $(this).siblings('.yelp-details').show();
    },function(){
      $(this).siblings('.yelp-details').hide();
    }
  );

  $('.btn-success').on('click' function(){
    var proj_id = $(this).parent().data('id');
    $($('.project-item[data-id='+proj_id+']').children()[0]).toggleClass('collaborator_wanted');
    $($('.project-item[data-id='+proj_id+']').children()[1]).toggleClass('collaborator_wanted');
    if ( $($('.project-item[data-id='+proj_id+']').children()[1]).text() ){
      $($('.project-item[data-id='+proj_id+']').children()[1]).text('');
    } else {
      $($('.project-item[data-id='+proj_id+']').children()[1]).text('Help Wanted');
    }
    

  })
    

});









