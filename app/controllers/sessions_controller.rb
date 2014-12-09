class SessionsController < ApplicationController
  after_action :set_origin_path

  def create
    auth_hash = request.env["omniauth.auth"]
    user = User.get_user_from_omniauth(auth_hash)
    repos = Github.repos.list(user: "#{user.gh_username}")
    user.create_or_update_projects(repos)
    login(user)
    redirect_to root_path
  end

  def destroy
    # reset_session
    session[:user_id] = nil
    # redirect_to session[:origin_path]
    redirect_to root_path
  end


  private
    def set_origin_path
      # session[:origin_path] = request.path
    end
end
