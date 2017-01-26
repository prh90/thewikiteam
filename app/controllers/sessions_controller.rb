class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by(login_params)

    if user
      session[:user_id] = user.id
      redirect_to root_path
    else
      @error = "Your email or password is incorrect"
      render 'new'
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