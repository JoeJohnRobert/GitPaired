class ProjectsController < ApplicationController

  def update
    @user = User.find(session[:user_id])
    @project = Project.find(params[:id])
    if params[:project][:collaborator_wanted] == 'toggle'
      if @project.collaborator_wanted == true
        @project.update(:collaborator_wanted => false)
      else
        @project.update(:collaborator_wanted => true)
      end
    end

  end

  def edit
binding.pry
  end

  private
    def project_params
      params.require(:project).permit(:user_id, :collaborator_wanted)
    end


end
