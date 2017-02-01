class UsersController < ApplicationController
  include ApplicationHelper
  def new
  end

#if user is saved, go back to welcome page
#if user is not saved, reload new user form
  def create
    @user = User.new(user_params)
    if @user.save
      login(@user)
      redirect_to root_path
    else
      puts "*" * 30 + "inside controller: " + @user.errors.full_messages[0] + "*" * 30
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:username,:email,:password)
  end

end
