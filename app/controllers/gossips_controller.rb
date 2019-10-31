class GossipsController < ApplicationController

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
    @author = Author.find(session[:user_id])
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
