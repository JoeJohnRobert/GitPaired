class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @full_name = @user.first_name + " " + @user.last_name
    if @user.zipcode
      @neighborhood = @user.get_neighborhood
    end
    if current_user
      coords_array = Geocoder::Calculations.geographic_center(["#{@user.zipcode}", "#{current_user.zipcode}"])
      @coords_hash = {latitude: coords_array[0], longitude: coords_array[1]}
    end
    search_params = {term: 'wifi', limit: 2, sort: 1}
    response = YELP.search_by_coordinates(@coords_hash, search_params)
    @wifi_spots = response.businesses.map {|biz| [biz.name, biz.rating, biz.url]}
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
