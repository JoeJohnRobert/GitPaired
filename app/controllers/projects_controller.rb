class ProjectsController < ApplicationController

  def update

    @user = User.find(session[:user_id])
    @project = Project.find(params[:id])
# binding.pry
    @check= params[:project][:collaborator_wanted] 
    if params[:project][:collaborator_wanted] && params[:project][:collaborator_wanted] == 'toggle'
      if @project.collaborator_wanted == true
        @project.update(:collaborator_wanted => false)
      else
        @project.update(:collaborator_wanted => true)
      end
    end

    if params[:project][:description]
   
      @project.update(description: params[:project][:description], need_help_with: params[:project][:need_help_with])
    end

  end

#   def edit
# binding.pry
#   end

  private
    def project_params
      params.require(:project).permit(:user_id, :collaborator_wanted, :description)
    end


end
