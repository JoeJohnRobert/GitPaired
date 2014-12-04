class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :logged_in?


  private
    def logged_in?
      !!current_user
    end

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def login(user)
      flash[:info] = "You're logged in!"
      session[:user_id] = user.id
    end

    def logout
      session[:user_id] = nil
    end

    def authorize
      if !logged_in?
        flash[:danger] = "Please login first"
        redirect_to root_path
      end  
    end

end
