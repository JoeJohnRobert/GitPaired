class SessionsController < ApplicationController

  def create
    auth_hash = request.env["omniauth.auth"]
    user = User.get_user_from_omniauth(auth_hash)
    repos = Github.repos.list(user: "#{user.gh_username}")
    user.create_or_update_projects(repos)
    login(user)
    redirect_to_origin_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to_origin_path
  end

end
