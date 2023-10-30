class PostsController < ApplicationController
    before_action :authenticate_user!, only: [:create, :destroy]
    before_action :set_post, only: [:show, :destroy, :like, :unlike]

  
    def index
      @posts = Post.all
    end
    
    def create
      @post = current_user.posts.build(post_params)
      if @post.save
        redirect_to root_path, notice: 'Post created successfully.'
      else
        redirect_to root_path, alert: 'Post creation failed.'
      end
    end
  
    def edit
      @post = Post.find(params[:id])
    end

    def show
      @post = Post.find(params[:id])
      @comments = @post.comments
    end

    def like
      @post = Post.find(params[:id])
      @post.likes.create(user_id: current_user.id)
      @post.increment!(:likes_count)
    
      redirect_to @post
    end
    
    def destroy
      @post = current_user.posts.find(params[:id])
      @post.destroy
      redirect_to posts_path, notice: 'Post deleted successfully.'
    end
  
    private
  
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :content, images: [])
    end
    
end