class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @curr_user = current_user
    @full_name = @user.first_name + " " + @user.last_name
    @language_logos = ['c++','c','css','html','javascript','php','python','ruby','sql']
    if @user.zipcode
      @neighborhood = @user.get_neighborhood
    end
    if current_user
      coords_array = Geocoder::Calculations.geographic_center(["#{@user.zipcode}", "#{current_user.zipcode}"])
      @coords_hash = {latitude: coords_array[0], longitude: coords_array[1]}
      search_params = {term: 'wifi', category_filter: 'coffee', radius_filter: 3200, limit: 2, sort: 2}  
      response = YELP.search_by_coordinates(@coords_hash, search_params) 
      @wifi_spots = response.businesses.map {|biz| [biz.name, biz.rating, biz.url, biz.image_url]}
    
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to root_path
  end

  private
    def user_params
      params.require(:user).permit(:zipcode, :email)
    end

end
