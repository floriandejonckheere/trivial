ready = ->
  $('.color-box input[type="radio"]:checked').siblings('.radio-label').removeClass('radio-label-inactive').addClass 'radio-label-active'
  $('.color-box').click ->
    $(this).find('input[type="radio"]').prop 'checked', true
    $('.color-box .radio-label').addClass('radio-label-inactive').removeClass 'radio-label-active'
    $(this).find('.radio-label').removeClass('radio-label-inactive').addClass 'radio-label-active'
    return
  $.material.ripples '.color-box'
  return


$(document).ready(ready)
$(document).on('page:load', ready)
