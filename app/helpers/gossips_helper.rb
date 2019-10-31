module GossipsHelper
def current_user
    Author.find_by(id: session[:user_id])
  end

  def log_in(user)
    session[:user_id] = user.id
  end
end
