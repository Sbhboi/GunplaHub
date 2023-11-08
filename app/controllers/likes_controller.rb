class LikesController < ApplicationController
    def show
      @post = Post.find(params[:id])
    end

    def create
      likable_type = params[:likable_type]
      likable_id = params[:likable_id]
      @likable = likable_type.constantize.find(likable_id)
      @like = @likable.likes.find_or_initialize_by(user: current_user)
  
      if @like.persisted?
        @like.destroy
        liked = false
      else
        @like.save
        liked = true
      end
  
      render json: { liked: liked }
    end
end