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
    current_user.likes.create(likeable: @comment)
    redirect_to @comment.post, notice: 'Comment liked successfully.'
  end

  def unlike
    current_user.likes.find_by(likeable: @comment).destroy
    redirect_to @comment.post, notice: 'Comment unliked successfully.'
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end