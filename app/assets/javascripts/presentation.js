var shuffle = function(array){
  var m = array.length, t, i;

  // While there remain elements to shuffle
  while(m){

    // Pick a remaining element
    i = Math.floor(Math.random() * m--);

    // And swap it with the current element.
    t = array[m];
    array[m] = array[i];
    array[i] = t;
  }

  return array;
};

$(function(){

  $('.overlay-card').fadeOut();

  $('#btn-back').click(function(){
    $('.overlay-card').fadeOut();
  });

  $(document).on('keydown',function(evt) {
    if (evt.keyCode == 27) {
     $('.overlay-card').fadeOut();
    }
  });

  /**
   * (View)Models
   * 
   * */

  // Category Model
  var Category = function(props){
    var self = this;

    self.id = props.id;
    self.title = props.title;
    self.color = 'well-material-' + props.color;
    self.cards = ko.observableArray();
    self.current = ko.observable(0);
  };

  // Card Model
  var Card = function(props){
    var self = this;

    self.id = props.id;
    self.question = props.question;
    self.answer = props.answer;
    self.category = props.category;
  };

  // ViewModel for the document (aka the categories)
  var viewModel = {
    categories: [],
    showCard: function(category){
      if(category.current() == category.cards().length){
        if(confirm('You have seen all cards. Would you like to reshuffle all cards?')){
          var arr = category.cards();
          shuffle(arr);
          category.cards(arr);
          category.current(0);
        }
      } else {
        cardViewModel.card(category.cards()[category.current()]());
        $('.overlay-card').fadeIn();
        $('#text-answer').slideUp(0);
      }
    }
  };

  // ViewModel for the current question
  var cardViewModel = {
    card: ko.observable({
      question: 'Dummy question',
      answer: 'Dummy answer'
    }),
    showAnswer: function(){
      $('#text-answer').slideToggle();
      $.grep(viewModel.categories, function(val){
        if(val.id == cardViewModel.card().category){
          val.current(val.current() + 1);
        }
      });
    }
  }


  /**
   * Application logic
   * 
   * */

  var width = 0;
  var progress = function(amount){
    width = Math.min(width + amount, 100);
    $('#progress-loading').css('width', width + '%');
  };

  $.when(
    $.getJSON('/categories', function(data){
      $.each(data.categories, function(idx, val){
        viewModel.categories.push(new Category({
          id: val.id,
          title: val.title,
          color: val.color
        }));

        // All categories amount to 20%
        progress((1 / data.categories.length) * 20);
      });
    }),

    // Fetch cards
    $.getJSON('/cardsets/' + $('#cardset_id').val(), function(data){
      $.each(data.cards, function(idx, val){
        $.grep(viewModel.categories, function(el, idx){
          if(el.id == val.category){
            el.cards.push(ko.observable(new Card({
              id: val.id,
              question: val.question,
              answer: val.answer,
              category: val.category
            })));
          }
        });
        // All cards amount to 80%
        progress((1 / data.cards.length) * 80);
      });

      // Shuffle cards
      $.each(viewModel.categories, function(idx, val){
        var arr = val.cards();
        shuffle(arr);
        val.cards(arr);
      });
    })
  ).done(function(){
    $('.overlay').fadeOut();
    ko.applyBindings(viewModel, $('main')[0]);
    ko.applyBindings(cardViewModel, $('.overlay-card')[0]);
  });
});
