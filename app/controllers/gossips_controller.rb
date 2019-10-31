class GossipsController < ApplicationController
    before_action :authenticate_user, only: [:create]


  def index
    @gossips = Gossip.all
  end

  def show
     @gossip = Gossip.find(params[:id])
  end

  def new
    # Méthode qui crée un potin vide et l'envoie à une view qui affiche le formulaire pour 'le remplir' (new.html.erb)
  end

  def create
    @author = current_user
    @gossip = Gossip.new(author: @author, title: params[:title], content: params[:content])

    if @gossip.save
      redirect_to gossips_path
    else
      render 'gossips/new'
    end


  end

  def edit
    @gossip = Gossip.find(params[:id])

  end

  def update
    @gossip = Gossip.find(params[:id])
    gossip_params = params.require(:gossip).permit(:title, :content)
    if @gossip.update(gossip_params)
      redirect_to gossips_path
    else
      render :edit
    end

  end

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    redirect_to gossips_path

  end
end


  private

  def authenticate_user
    unless @author
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    end
  end
