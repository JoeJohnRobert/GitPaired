class ProjectsController < ApplicationController

  def update
    @user = User.find(session[:user_id])
    @project = Project.find(params[:id])
    @project.update(project_params)
  end

  private
    def project_params
      params.require(:project).permit(:user_id, :collaborator_wanted, :description, :need_help_with)
    end
end
