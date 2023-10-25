$(document).ready(function() {
    $('.reply-button').click(function() {
      $(this).siblings('.comment-textarea-container').toggle();
    });
  });