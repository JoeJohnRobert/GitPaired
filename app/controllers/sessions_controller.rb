class SessionsController < ApplicationController
  after_action :set_origin_path

  def new

  end

  def create
    # binding.pry
    auth_hash = request.env["omniauth.auth"]
    User.get_user_from_omniauth(auth_hash)
    redirect_to session[:origin_path]
  end

  def destroy
  end


  private
    def set_origin_path
      session[:origin_path] = request.path
    end
end
