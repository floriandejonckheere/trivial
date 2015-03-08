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
//= require_tree .
//= require presentation
//= require application
//= require bootstrap/dist/js/bootstrap.min
//= require bootstrap-material-design/dist/js/ripples.min
//= require bootstrap-material-design/dist/js/material.min
//= require dropdown.js/jquery.dropdown

$(document).ready(function(){
  $.material.init();
  $(".select").dropdown();
  $('[data-toggle="tooltip"]').tooltip();
  $('.row-collapsed').slideToggle(0);
});

// http://stackoverflow.com/a/27578736
var site;
var site;
if(!window.Site) {
  site = window.Site = {};
  site.controllers = {}

  site.load = function (controller) {
    if (this.controllers.hasOwnProperty(controller)) {
      this.controllers[controller].call();
    }
  };

  site.add = function (controller, fn) {
    this.controllers[controller] = fn;
  }
}
