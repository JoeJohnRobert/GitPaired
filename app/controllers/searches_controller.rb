class SearchesController < ApplicationController 

  def index
    @query = params[:query]
    @users = User.where(:location => @query)
    if @users.size > 0
      render :index
    elsif @query[(/\d{5}/)] == @query
      redirect_to root_path, notice: "Sorry, we don't have any users yet in that zip!"
    else 
      redirect_to root_path, notice: "No results"
    end
  end  

  # def create
  #   @query = params[:query]
  #   @users = User.where(:location => @query)
    
  # end



end
