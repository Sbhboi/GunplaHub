class RegistrationsController < Devise::RegistrationsController
    def create
        super do |resource|
          resource.username = params[:user][:username]
          flash[:notice] = I18n.t('devise.registrations.signed_up', username: resource.username)
        end
    end
    
    protected
  
    def after_sign_up_path_for(resource)
      user_path(resource)
    end
  
    def after_update_path_for(resource)
      user_path(resource)
    end
  end