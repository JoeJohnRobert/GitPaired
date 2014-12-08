class SearchesController < ApplicationController 

  def index
    @query = params[:query]
    @radius = 10 #measured in miles
    @users = User.select_nearby_users(current_user, @query, @radius)
    @users.each { |u| @projects = u.all_projects }
    @language_filters = @projects.map {|p| p.language}.uniq
    @fade_options=['fade-right d1','fade-right','fade_left','fade-left d1']

    if @users.size > 0
      render :index
    elsif @query[(/\d{5}/)] == @query
      redirect_to root_path, notice: "Sorry, we don't have any users yet in that zip!"
    else 
      redirect_to root_path, notice: "No results"
    end
  end  


end
