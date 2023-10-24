class PostsController < ApplicationController
    before_action :authenticate_user!, only: [:create, :destroy]
  
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

    def destroy
      @post = current_user.posts.find(params[:id])
      @post.destroy
      redirect_to posts_path, notice: 'Post deleted successfully.'
    end
  
    private
  
    def post_params
      params.require(:post).permit(:title, :content, :image)
    end
  end