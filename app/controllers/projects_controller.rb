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
    # @project.update(:collaborator_wanted => params[:collaborator_wanted])
    # redirect_to user_path(@user)
  end

end
