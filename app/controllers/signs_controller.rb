class SignsController < ApplicationController

  def new

  end

  def create
    a = Author.new(name: params[:username], password: params[:mdp])

  if a.save && a.authenticate(params[:mdp])
      log_in(a)
          redirect_to gossips_path
  end
  end
end
