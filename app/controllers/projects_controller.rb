class ProjectsController < ApplicationController

  def update
    @user = User.find(session[:user_id])
    @project = Project.find(params[:id])
    @project.update(project_params)
    redirect_to user_path(@user)
  end

  private

  def project_params
    params.require(:project).permit(:user_id, :collaborator_wanted)
  end


end
