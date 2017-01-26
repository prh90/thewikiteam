class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by(login_params)
    session[:user_id] = user.id

    if session[:user_id]
      redirect_to root_path
    else
      redirect_to login_path
    end
  end

  def destroy
    session.clear
    redirect_to new_user_path
  end

  private

  def login_params
    params.require(:user).permit(:email,:password)
  end

end