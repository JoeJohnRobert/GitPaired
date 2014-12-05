class ProjectsController < ApplicationController

  def update
    @user = User.find(session[:user_id])
    @project = Project.find(params[:id])
    @project.update(:collaborator_wanted => params[:collaborator_wanted])
    redirect_to user_path(@user)
  end

end
