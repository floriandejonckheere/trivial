class CardsetsController < ApplicationController

  def index
  end

  def new
    @cardset = Cardset.new
  end

  def create
    @cardset = Cardset.new(params[:cardset].permit(:title))
    if @cardset.save
      redirect_to cardsets_path
    else
      render 'new'
    end
  end

  def edit
    @cardset = Cardset.find(params[:id])
  end

  def update
    @cardset = Cardset.find(params[:id])

    if @cardset.update(params[:cardset].permit(:title))
      redirect_to cardsets_path
    else
      render 'edit'
    end
  end

  def destroy
    @cardset = Cardset.find(params[:id])
    @cardset.destroy

    redirect_to cardsets_path
  end

  def show
    @cardset = Cardset.find(params[:id])
  end

  
  def toggle_visible
    @cards = Cardset.find(params[:cardset_id]).cards.where(:category => params[:category_id])
    @cards.each do |card|
      card.update_attribute(:visible, true)
    end
    render :nothing => true
  end

end
