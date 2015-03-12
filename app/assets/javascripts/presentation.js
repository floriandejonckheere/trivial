$(document).ready(function(){
  var cardset = $('#cardset_id').val();
  var category = $('#category_id').val();

  window.categories = {};
  window.cards = {};

  window.currentSet = [];
  window.currentIdx = 0;

  var updateView = function(){
    //~ $.ajax({
      //~ type: 'GET',
      //~ url: '/cardsets/' + cardset + '/cards/' + window.currentSet[window.currentIdx].id + '/toggle_visible',
      //~ success: function(){
        //~ console.log('Set visible: ' + window.currentSet[window.currentIdx].question);
      //~ }
    //~ });
    $('#text-question').html(window.currentSet[window.currentIdx].question);
    $('#text-answer').fadeOut(400, function(){ $(this).html(window.currentSet[window.currentIdx].answer); });
  }

  $.ajax({
    type: 'GET',
    url: '/cardsets/' + cardset + '.json',
    success: function(data){
      $.each(data.cards, function(idx, val){
        if(!window.cards[val.category]) window.cards[val.category] = [];
        window.cards[val.category].push({
          id: val.id,
          question: val.question,
          answer: val.answer,
          category: val.category,
          visible: val.visible
        });
      });
      
      $.ajax({
        type: 'GET',
        url: '/categories.json',
        success: function(data){
          $.each(data.categories, function(idx, val){
            window.categories[val.id] = {
              title: val.title,
              color: val.color
            };
          });

          $('#category_select').change(function(){
            $('main').removeClass().addClass('well-material-' + window.categories[$(this).val()].color);
            
            window.currentSet = [];
            window.currentIdx = 0;
            $.each(window.cards[$(this).val()], function(idx, val){
              if(val.visible){
                window.currentSet.push({
                  question: val.question,
                  answer: val.answer,
                  id: val.id
                });
              }
            });
            $('#btn-previous').attr('disabled', true);
            if(window.currentSet.length > 0){
              $('#text-question').show();
              $('#text-completed').hide();
              if(window.currentSet.length == 1) $('#btn-next').attr('disabled', true);
              // TODO: shuffle
              updateView();
            } else {
              $('#text-question').hide();
              $('#text-answer').fadeOut();
              $('#text-completed').show();
            }
          });
          $('#category_select').change();
          
          $('#btn-previous').click(function(){
            if(window.currentIdx != 0){
              window.currentIdx--;
              updateView();
              $('#btn-next').attr('disabled', false);
              if(window.currentIdx == 0)
                $('#btn-previous').attr('disabled', true);
            }
          });
          
          $('#btn-next').click(function(){
            if(window.currentIdx < (window.currentSet.length - 1)){
              window.currentIdx++;
              updateView();
              $('#btn-previous').attr('disabled', false);
              if(window.currentIdx == (window.currentSet.length - 1))
                $('#btn-next').attr('disabled', true);
            }
          });
          
          $('#btn-answer').click(function(){
            $('#text-answer').fadeToggle();
          });
        }
      });
    }
  });

});
