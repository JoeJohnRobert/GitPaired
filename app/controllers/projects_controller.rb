class ProjectsController < ApplicationController

  def update

    @user = User.find(session[:user_id])
    @project = Project.find(params[:id])

      @project.update(description: params[:project][:description], need_help_with: params[:project][:need_help_with], collaborator_wanted: params[:collaborator_wanted])


  end

#   def edit
# binding.pry
#   end

  private
    def project_params
      params.require(:project).permit(:user_id, :collaborator_wanted, :description)
    end


end
