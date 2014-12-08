class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @full_name = @user.first_name + " " + @user.last_name
    if @user.zipcode
      @neighborhood = @user.get_neighborhood
    end
  end

  def update
    # raise params.inspect
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to root_path
  end

  private
    def user_params
      params.require(:user).permit(:zipcode, :email)
    end

end
