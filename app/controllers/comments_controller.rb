class CommentsController < ApplicationController
  before_action :set_comment, only: [:like, :unlike]

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params.merge(user: current_user))
    if @comment.save
      respond_to do |format|
        format.html { redirect_to post_path(@post), notice: 'Comment created successfully.' }
        format.js # Render create.js.erb for AJAX response
      end
    else
      respond_to do |format|
        format.html { redirect_to post_path(@post), alert: 'Comment creation failed.' }
        format.js # Render create.js.erb for AJAX response
      end
    end
  end

  def like
    comment = Comment.find(params[:id])
    like_count = comment.likes.count

    render json: { success: true, likeCount: like_count }
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
  
end