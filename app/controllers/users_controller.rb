class UsersController < ApplicationController
  def show
    @user= User.find(params[:id])
    @full_name = @user.first_name + " " + @user.last_name
    @neighborhood = @user.get_neighborhood
  end

end
