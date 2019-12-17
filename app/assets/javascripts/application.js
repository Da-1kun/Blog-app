// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery
//= require activestorage
//= require turbolinks
//= require semantic-ui
//= require_tree .

$(document).on('turbolinks:load', () => {
  // fix menu when passed
  $('.masthead')
  .visibility({
    once: false,
    onBottomPassed: function() {
      $('.fixed.menu').transition('fade in');
    },
    onBottomPassedReverse: function() {
      $('.fixed.menu').transition('fade out');
    }
  });

  // create sidebar and attach to menu open
  $('.ui.sidebar')
    .sidebar('attach events', '.toc.item');

  // flash message close action
  $('.message .close').on('click', e => {
    $(e.target).closest('.message').transition('fade');
  });

  $('#infoMsg').fadeOut(7500);

  $('#article_category_ids').dropdown({
    maxSelections: 3
  });

  // display Modal
  $('#delete_article_btn').on('click', () => {
    $('#articleModal').modal('show');
  })
  $('#user_article_btn').on('click', () => {
    $('#userModal').modal('show');
  })
}) 
