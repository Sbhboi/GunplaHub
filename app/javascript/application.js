// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
//= require rails-ujs
import "@hotwired/turbo-rails"
import "controllers"

function likeFunction(button) {
    var likableType = button.dataset.likableType;
    var likableId = button.dataset.likableId;
  
    // Send an AJAX request to like/unlike the post
    $.ajax({
      url: "/likes",
      method: "POST",
      data: {
        likable_type: likableType,
        likable_id: likableId
      },
      success: function(response) {
        if (response.liked) {
          button.innerHTML = '<b><i class="fa fa-thumbs-down"></i> Unlike</b>';
        } else {
          button.innerHTML = '<b><i class="fa fa-thumbs-up"></i> Like</b>';
        }
      },
      error: function(error) {
        console.log(error);
      }
    });
  }