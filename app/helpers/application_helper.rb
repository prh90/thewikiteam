module ApplicationHelper
  def current_user
    if session[:user_id]
      @user = User.find(session[:user_id])
    else
      nil
    end
  end

  def login(user)
  	session[:user_id] = user.id
  end
end
