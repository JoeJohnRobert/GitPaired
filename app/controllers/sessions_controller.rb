# class SessionsController < ApplicationController
  # after_action :set_origin_path


  def create
    # binding.pry
    auth_hash = request.env["omniauth.auth"]
    # binding.pry
    User.get_user_from_omniauth(auth_hash)
    redirect_to root_path
  end

  def destroy
    reset_session
    redirect_to root_path
  end


  private
    def set_origin_path
      # session[:origin_path] = request.path
    end
end
