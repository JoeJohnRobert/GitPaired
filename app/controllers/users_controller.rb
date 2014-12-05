class UsersController < ApplicationController
  def show
    @user= User.find(params[:id])
    @full_name = @user.first_name + " " + @user.last_name
    if @user.location
      @neighborhood = @user.get_neighborhood
    end
  end

  def update
    @user= User.find(params[:id])
    @user.update(location: params[:location])
    redirect_to root_path
  end

end
