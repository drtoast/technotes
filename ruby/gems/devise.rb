# Authentication framework
# https://github.com/plataformatec/devise

# with OmniAuth
# https://github.com/plataformatec/devise/wiki/OmniAuth:-Overview

# Gemfile:
gem 'devise'
gem 'omniauth-google-oauth2'
gem 'omniauth-github'
gem 'omniauth-twitter'
gem 'omniauth-facebook'

# config/intializers/devise.rb:
github_config = YAML.load_file("#{Rails.root.to_s}/config/github.yml")[Rails.env]
config.omniauth :github, github_config['client_id'], github_config['secret'], :scope => 'repo'

google_config = YAML.load_file("#{Rails.root.to_s}/config/google.yml")[Rails.env]
config.omniauth :google_oauth2, google_config['client_id'], google_config['secret'], {
                    :scope => 'userinfo.email,userinfo.profile,https://www.googleapis.com/auth/calendar',
                    :approval_prompt => ''
                  }

config.omniauth :facebook, "APP_ID", "APP_SECRET"

# app/models/user.rb:
class User < ActiveRecord::Base
  devise :omniauthable
end

# routes.rb:
devise_for :users, :controllers => { :omniauth_callbacks => 'employees/omniauth_callbacks' }

# view:
link_to "Sign in with Facebook", user_omniauth_authorize_path(:facebook)

# handle callbacks:
# app/controllers/users/omniauth_callbacks_controller.rb
class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    # You need to implement the method below in your model
    @user = User.find_for_facebook_oauth(request.env["omniauth.auth"], current_user)

    if @user.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Facebook"
      sign_in_and_redirect @user, :event => :authentication
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end
end