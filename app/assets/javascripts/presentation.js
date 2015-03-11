$(document).ready(function(){
  var i, max, updateProgress;

  updateProgress = function(id) {
    $('#progress').css('width', (i / max) * 100 + '%');
    $('#progress-done').html(i);
  };

  i = 0;

  max = Number.MIN_VALUE;

  $('[id^="card-"]').each(function() {
    var num;
    num = parseInt(this.id.split('-')[1], 10) || 0;
    max = Math.max(num, max);
  });

  max++;

  $('#progress-max').html(max);

  $('.action-toggle').click(function() {
    $(this).parents('[id^="card-"]').toggleClass('flipped');
  });

  $('.action-previous').click(function() {
    if ($(this).parents('[id^="card-"]').attr('id') === "card-0") {
      $(this).addClass('text-muted');
    } else {
      $(this).parents('[id^="card-"]').removeClass('flipped');
      $('[id="card-' + i + '"]').addClass('hidden');
      i = (((i - 1) % max) + max) % max;
      $('[id="card-' + i + '"]').removeClass('hidden');
      updateProgress(i);
    }
  });

  $('.action-next').click(function() {
    $(this).parents('[id^="card-"]').removeClass('flipped');
    $('[id="card-' + i + '"]').addClass('hidden');
    i++;
    if (i >= max) {
      $('#finished').removeClass('hidden');
    } else {
      $('[id="card-' + i + '"]').removeClass('hidden');
    }
    updateProgress(i);
  });

  $('#action-restart').click(function() {
    $('#finished').addClass('hidden');
    $('[id="card-' + i + '"]').addClass('hidden');
    i = 0;
    $('[id="card-0"]').removeClass('hidden');
    updateProgress(i);
  });
});
