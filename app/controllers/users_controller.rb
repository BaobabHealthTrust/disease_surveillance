class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => [:authenticate, :create, :delete_me]
  before_filter :authenticate_user, :except => [:login, :authenticate, :create]
  
  def new
    render :layout => "users_menu"
  end

  def create
    available_user = User.find(params[:username])
    if available_user.blank?
      unless (params[:password] == params[:password_confirm])
        flash[:error] = "Unale to create user account. Password mismatch!!"
        redirect_to(users_login_path) and return if params[:from_login]
        redirect_to(users_new_user_path) and return
      end
      user = User.new
      user.username = params[:username]
      user.password_hash = params[:password]
      user.first_name = params[:first_name]
      user.last_name = params[:last_name]
      user.email = params[:email]
      if user.save
        flash[:notice] = "Your user account has been successfully created"
        redirect_to(users_login_path) and return if params[:from_login]
        redirect_to(users_new_user_path) and return
        redirect_to('/') and return
      else
        flash[:error] = "There was an error creating your account"
        redirect_to(users_login_path) and return if params[:from_login]
        redirect_to(users_new_user_path) and return
      end

    else
      flash[:error] = "Unable to create user. Username already exists"
      redirect_to(users_login_path) and return if params[:from_login]
      redirect_to(users_new_user_path) and return
    end
  end

  
  def login
    render :layout => false
  end

  def user_menu
    render :layout => "users_menu"
  end

  def authenticate
    @user = User.find(params[:username])
    unless @user.blank?
      if @user.password == params[:password]
        flash[:notice] = "Welcome #{params[:username]}"
        session[:current_user_id] = @user.id
        User.current_user = @user
        redirect_to ('/') and return
      else
        flash[:error] = 'Wrong username/password combination'
        redirect_to (users_login_path) and return
      end
    else
      flash[:error] = 'Wrong username/password combination'
      redirect_to (users_login_path) and return
    end
  end
  
  def logout
    session[:current_user_id] = nil
    User.current_user = nil
    flash[:notice] = 'You have been logged out.'
    redirect_to (users_login_path) and return
  end

  def users_menu

  end

  def new_user
    
  end

  def update_user
    user = User.find(params[:user_id])
    user.username = params[:username]
    user.first_name = params[:first_name]
    user.last_name = params[:last_name]
    user.email = params[:email]
    if user.save
      flash[:notice] = "You have successfully updated user account"
      redirect_to users_edit_user_path and return
    else
      flash[:error] = "Unable to update user account."
      redirect_to users_edit_user_path, :user_id => params[:user_id] and return
    end
  end
  
  def edit_user
    unless params[:user_id].blank?
      @user = User.find(params[:user_id])
    end
    @active_users = User.by_active.key(true)
  end

  def delete_user
    @active_users = User.by_active.key(true)
  end

  def delete_me
    user = User.find(params[:username])
    user.active = false
    user.save
    render :text => true and return
  end

  def my_profile
    @user = User.find(session[:current_user_id])
  end

  def field_edit
    
  end
end
