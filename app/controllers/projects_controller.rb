class ProjectsController < ApplicationController

  def update
    @user = User.find(session[:user_id])
    @project = Project.find(params[:id])
    @project.update(project_params)
    @project.update(collaborator_wanted: params[:collaborator_wanted]) #collab wanted not on the same hash level
  end

  private
    def project_params
      params.require(:project).permit(:user_id, :description, :need_help_with)
    end
end
