class UsersController < ApplicationController
    def profile
      @user = current_user
    end

    def update_avatar
      @user = User.find(params[:id])
      @user.avatar.attach(params[:user][:avatar])
      redirect_to user_profile_path, notice: 'Avatar uploaded successfully.'
    end
  end