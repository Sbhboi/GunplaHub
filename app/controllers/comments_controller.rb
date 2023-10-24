class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params.merge(user: current_user))
    if @comment.save
      redirect_to @post, notice: 'Comment created successfully.'
    else
      redirect_to @post, alert: 'Failed to create comment.'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
