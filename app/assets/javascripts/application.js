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

    $(document).delegate("#brand", 'click', function(e) {
      e.preventDefault();
      window.location = "/";
    });

    $(document).delegate("#home", 'click', function(e) {
      e.preventDefault();
      window.location = "/";
    });

    $(document).delegate("#show_link_to_email_friend", 'click', function(e) {
        e.preventDefault();
        $('#notify_friend_form').slideDown();
    });

    $(document).delegate("#show_link_to_email_owner", 'click', function(e) {
       e.preventDefault();
       $('#email_owner_form').slideDown();
    });

    $('#search_articles_form_text_field').tokenInput("/articles/search_autocomplete",
       {
           theme: "facebook",
           tokenLimit:1,
           minChars: 2,
           resultsLimit: 10,
           hintText: "Please type in the search term...",
           noResultsText: "No results have been found...",
           searchingText: "We're searching...",
           preventDuplicates: true,
           propertyToSearch: "article",
           resultsFormatter: function(item){
             return "<li>"  +
             item.article  + "," + "<span style='padding-left: 10px'>"+ " $" +item.price + "</span>" + "</li>"
         }
       }
    );

    $("#token-input-search_articles_form_text_field").val("Search Items...");


    $("#token-input-search_articles_form_text_field").focus(function () {

      $(this).css("width", "300px");
      $(this).val("");
    });

    $("#token-input-search_articles_form_text_field").keyup(function () {

      $(this).css("width", "300px");

    });

    $("#token-input-search_articles_form_text_field").blur(function () {

      $(this).css("width", "300px");
      $(this).val("Search Items...");

    });
});