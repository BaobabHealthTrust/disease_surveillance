class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :authenticate_user

  protected

  def authenticate_user
    return true if User.find(session[:current_user_id])
    access_denied
    return false
  end
    
  def access_denied
    flash[:error] = 'Oops. You need to login before you can view that page.'
    redirect_to (users_login_path) and return
  end
  
end
