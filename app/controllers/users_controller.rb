class UsersController < ApplicationController

  def create
    @user = OAuther.authenticate(env['omniauth.auth'])
    unless @user.valid?
      @user.firstname = env['omniauth.auth']['info']['first_name']
      @user.lastname = env['omniauth.auth']['info']['last_name']
      @user.email = env['omniauth.auth']['info']['email']
    end
    if @user.save
      flash[:success] = "Welcome to Findpather."
      redirect_to user_spells_path(@user)
    else
      flash[:failure] = "Unable to authenticate."
      redirect_to root
    end
  end

end
