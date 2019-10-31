class SessionsController < ApplicationController
  
  def new
  end


  def create
    user = Author.find_by(name: params[:username])

    if user && user.authenticate(params[:mdp])
      session[:user_id] = user.id
          redirect_to gossips_path

    else
      flash.now[:danger] = 'Invalide email/password combination'
      render 'new'
    end
  end


  def destroy
    session.delete(:user_id)
  end
end
