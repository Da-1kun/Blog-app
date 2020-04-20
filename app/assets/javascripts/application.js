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
  /**
   * Header Action
   */
  $('#header li, #header .toggle').on('click', () => {
    const header = document.querySelector('header');
    header.classList.toggle('active');
  });

  /**
   * Article Form Setting
   */
  if ($('#post').length) {
    const height = $('.editor-body').height() - 70;
    $('.CodeMirror.cm-s-default.CodeMirror-wrap').height(height);
    $('.uk-htmleditor-preview').height(height);
  }

  /**
   * Message Settings
   */
  $('.message .close').on('click', e => {
    $(e.target)
      .closest('.message')
      .transition('fade');
  });

  $('#infoMsg').fadeOut(7500);

  /**
   * Dropdown Settings
   */
  $('#article_category_ids').dropdown({
    maxSelections: 3
  });

  $('.ui.dropdown').dropdown({ showOnFocus: false });

  /**
   * Modal Actions
   */
  $('#delete_article_btn').on('click', () => {
    $('#articleModal').modal('show');
  });
  $('#delete_user').on('click', () => {
    $('#userModal').modal('show');
  });

  /**
   * Search action
   */
  $('#article_search').on('keydown', e => {
    e.target.value = e.target.value.trimStart();
    if (e.key == 'Enter' && e.target.value == '') {
      return false;
    }
    if (e.keyCode == 13 && e.target.value !== '') {
      $('#search').click();
      e.target.value = '';
      $('#article_search').trigger(e);
    }
  });
});
