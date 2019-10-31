module SignsHelper
module SessionsHelper
  def current_user
    Author.find(session[:user_id])
  end

  def log_in(user)
    session[:user_id] = user.id
  end

end
end
