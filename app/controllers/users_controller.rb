class UsersController < ApplicationController

  def create
    @user = OAuther.authenticate(env['omniauth.auth'])
    unless @user.valid?
      @user.firstname = env['omniauth.auth']['info']['first_name']
      @user.lastname = env['omniauth.auth']['info']['last_name']
      @user.email = env['omniauth.auth']['info']['email']
    end
    if @user.save
      session[:current_user_id] = @user.id
      flash[:success] = "Welcome to Findpather."
      redirect_to user_spells_path(@user)
    else
      flash[:failure] = "Unable to authenticate."
      redirect_to root
    end
  end

  def log_out
    session.delete(:current_user_id)
    if session[:current_user_id] == nil
      flash[:success] = "You have successfully logged out."
    else
      flash[:error] = "Error! You may not be signed out."
    end
    redirect_to root_path
  end

end
