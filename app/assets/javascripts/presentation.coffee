Site.add 'presentation', ->
  updateProgress = (id) ->
    $('#progress').css('width', (i/max)*100 + '%')
    $('#progress-done').html i
    return

  i = 0
  max = Number.MIN_VALUE;

  $('[id^="card-"]').each ->
      num = parseInt(this.id.split('-')[1], 10) || 0;
      max = Math.max(num, max)
      return

  max++

  $('#progress-max').html max

  $('.action-toggle').click ->
    $(this).parents('[id^="card-"]').toggleClass('flipped')
    return

  $('.action-previous').click ->
    if $(this).parents('[id^="card-"]').attr('id') == "card-0"
      $(this).addClass 'text-muted'
    else
      $(this).parents('[id^="card-"]').removeClass('flipped')
      $('[id="card-' + i + '"]').addClass 'hidden'
      i = (((i - 1) % max) + max) % max
      $('[id="card-' + i + '"]').removeClass 'hidden'
      updateProgress i
    return

  $('.action-next').click ->
    $(this).parents('[id^="card-"]').removeClass('flipped')
    $('[id="card-' + i + '"]').addClass 'hidden'
    i++;
    if i >= max
      $('#finished').removeClass 'hidden'
    else
      $('[id="card-' + i + '"]').removeClass 'hidden'
    updateProgress i
    return

  $('#action-restart').click ->
    $('#finished').addClass 'hidden'
    $('[id="card-' + i + '"]').addClass 'hidden'
    i = 0;
    $('[id="card-0"]').removeClass 'hidden'
    updateProgress i
    return

  return
