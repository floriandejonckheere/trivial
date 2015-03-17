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

  /**
   * Pico MVC framework
   * 
   * */
  // Model
  var Model = function(props){
    var self = this;

    self.fields = {};
    self.controller = props.controller || null;

    Object.keys(props).forEach(function(key){
      self.fields[key] = props[key];
    });
  };

  // View
  var View = function(props){
    var self = this;

    self.template = props.template || "";
    self.delimiter = props.delimiter || ", ";

    self.render = function(model){
      self.rendered = self.template;
      Object.keys(model.fields).forEach(function(key){
        if(model.fields[key] instanceof Array){
          self.rendered = self.rendered
                    .replace('{{' + key + '}}', model.fields[key].join(self.delimiter))
                    .replace('{{' + key + '.length}}', model.fields[key].length);
        } else {
          self.rendered = self.rendered
                    .replace('{{' + key + '}}', model.fields[key].toString());
        }
      });
      return self.rendered;
    };
  };

  var Controller = function(props){
    
  };

  /**
   * Application logic
   * 
   * */

  var CategoryView = new View({ template: $('[data-template="category"]').html() });

  var width = 0;
  var progress = function(amount){
    width = Math.min(width + amount, 100);
    $('#progress-loading').css('width', width + '%');
  };

  var categories = {};

  $.when(
    $.getJSON('/categories', function(data){
      $.each(data.categories, function(idx, val){
        var model = new Model({
          title: val.title,
          color: val.color,
          cards: []
        });
        categories[val.id] = model;
        $('[data-bind="categories"]').append(CategoryView.render(model));

        // All categories amount to 20%
        progress((1 / data.categories.length) * 20);
      });
    }),

    // Fetch cards
    $.getJSON('/cardsets/' + $('#cardset_id').val(), function(data){
      $.each(data.cards, function(idx, val){
        categories[val.category].fields.cards.push(new Model(val));

        // All cards amount to 80%
        progress((1 / data.cards.length) * 80);
      });
    });
  ).done(function(){
    $('.overlay').fadeOut();
  });
});
