Site.add 'presentation', ->
  i = 0
  max = Number.MIN_VALUE;

  $('[id^="card-"]').each ->
      num = parseInt(this.id.split('-')[1], 10) || 0;
      max = Math.max(num, max)
      return

  max++

  $('.action-toggle').click ->
    $(this).parents('[id^="card-"]').toggleClass('flipped')
    return

  $('.action-previous').click ->
    $(this).parents('[id^="card-"]').removeClass('flipped')
    $('[id="card-' + i + '"]').addClass 'hidden'
    i = (((i - 1) % max) + max) % max
    $('[id="card-' + i + '"]').removeClass 'hidden'

  $('.action-next').click ->
    $(this).parents('[id^="card-"]').removeClass('flipped')
    $('[id="card-' + i + '"]').addClass 'hidden'
    i = (i + 1) % max;
    $('[id="card-' + i + '"]').removeClass 'hidden'

  return
