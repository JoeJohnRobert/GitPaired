$(function(){
  $('button').on("click", 'i', function(){
      // alert('help')
      if ( ('i').attr('class') === 'fa fa-user user-color' ){
        ('i').removeClass().addClass('fa fa-user');
    } 
      else{
        ('i').removeClass().addClass('fa fa-user user-color');
    } 
     

      
    })  
})  