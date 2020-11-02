$(document).ready(function () {
  $.material.init();

  $('.color-box input[type="radio"]:checked').siblings('.radio-label').removeClass('radio-label-inactive').addClass('radio-label-active');

  $('.color-box').click(function () {
    $(this).find('input[type="radio"]').prop('checked', true);
    $('.color-box .radio-label').addClass('radio-label-inactive').removeClass('radio-label-active');
    $(this).find('.radio-label').removeClass('radio-label-inactive').addClass('radio-label-active');
  });
});
