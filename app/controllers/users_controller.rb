class UsersController < ApplicationController
  def new
  end

#if user is saved, go back to welcome page
#if user is not saved, reload new user form
  def create
    user = User.new(user_params)
    if user.save
      #needs to go back to root, not sure what that page will be
    else
      redirect_to new_user_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:username,:email,:password)
  end

end