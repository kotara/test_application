class Users::OmniauthCallbacksController < ApplicationController
  def facebook
   authentication_token = request.env['omniauth.auth'].credentials.token 
    @user = User.find_for_facebook_oauth request.env["omniauth.auth"]
    @user.update_attribute(:authentication_token, authentication_token)
    if @user.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Facebook"
      sign_in_and_redirect @user, :event => :authentication
    else
      flash[:notice] = "authentication error"
      redirect_to root_path
    end
  end

  def vkontakte
  authentication_token = request.env['omniauth.auth'].credentials.token
  	@user = User.find_for_vkontakte_oauth request.env["omniauth.auth"]
  	@user.update_attribute(:authentication_token, authentication_token)
    if @user.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Vkontakte"
      sign_in_and_redirect @user, :event => :authentication
    else
      flash[:notice] = "authentication error"
      redirect_to root_path
    end
  end
end
