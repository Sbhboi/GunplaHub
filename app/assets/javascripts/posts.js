document.addEventListener('DOMContentLoaded', function() {
    const likeUnlikeButton = document.querySelector('.like-unlike-button');
  
    if (likeUnlikeButton) {
      likeUnlikeButton.addEventListener('click', function(event) {
        event.preventDefault();
  
        const isLiked = likeUnlikeButton.dataset.liked === 'true';
  
        if (isLiked) {
          // Perform unlike action
          Rails.ajax({
            url: likeUnlikeButton.getAttribute('href'),
            type: 'DELETE',
            success: function() {
              likeUnlikeButton.textContent = 'Like';
              likeUnlikeButton.dataset.liked = 'false';
            },
            error: function() {
              console.error('Unlike action failed');
            }
          });
        } else {
          // Perform like action
          Rails.ajax({
            url: likeUnlikeButton.getAttribute('href'),
            type: 'POST',
            success: function() {
              likeUnlikeButton.textContent = 'Unlike';
              likeUnlikeButton.dataset.liked = 'true';
            },
            error: function() {
              console.error('Like action failed');
            }
          });
        }
      });
    }
  });
