// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require tinymce-jquery
//= require_tree .

/*
tinyMCE.init({
    // General options
    mode: "textareas",
    width: "400px",
    height: "200px"

});*/

$(document).ready(function() {

$(document).delegate("#show_link_to_email_friend", 'click', function(e) {
    e.preventDefault();
    $('#notify_friend_form').slideDown();
   });

$(document).delegate("#show_link_to_email_owner", 'click', function(e) {
    e.preventDefault();
    $('#email_owner_form').slideDown();
   });

});