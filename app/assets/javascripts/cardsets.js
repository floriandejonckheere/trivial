$(document).ready(function(){

  $('[data-toggle="visibility"]').click(function(){
    if($(this).attr('data-card-id') != null){
      // Toggle single card visibility
      $(this).children('i').toggleClass('mdi-action-visibility').toggleClass('mdi-action-visibility-off');
    } else if($(this).attr('data-category-id') != null){
      // Toggle whole category visibility
      $('[data-category="' + $(this).attr('data-category-id') + '"]').find('i.mdi-action-visibility-off').removeClass('mdi-action-visibility-off').addClass('mdi-action-visibility');
    } else return;
  });
});
