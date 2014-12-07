class SearchesController < ApplicationController 

  def index
    @query = params[:query]
    @radius = 2 #measured in miles
    @users = User.select_nearby_users(current_user, @query, @radius)
  
    if @users.size > 0
      render :index
    elsif @query[(/\d{5}/)] == @query
      redirect_to root_path, notice: "Sorry, we don't have any users yet in that zip!"
    else 
      redirect_to root_path, notice: "No results"
    end
  end  


end
