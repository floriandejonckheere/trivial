// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require application
//= require bootstrap/bootstrap
//= require arrive
//= require bootstrap-material-design/ripples
//= require bootstrap-material-design/material
//= require jquery.dropdown
//= require knockout

$(document).ready(function(){
  $.material.init();
  $(".select").dropdown();
  $('[data-toggle="tooltip"]').tooltip();
  $('.row-collapsed').slideToggle(0);
});
