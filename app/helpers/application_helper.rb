module ApplicationHelper
  def current_user
    puts "*" * 30 + session[:user_id].to_s + "*" * 30
    if session[:user_id]
      @user = User.find(session[:user_id])
    else
      nil
    end
  end
end
