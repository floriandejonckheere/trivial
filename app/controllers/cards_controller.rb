# frozen_string_literal: true

class CardsController < ApplicationController
  def new
    @card = Card.new
    @cardset = Cardset.find(params[:cardset_id])
  end

  def create
    @card = Card.new(params[:card].permit(:question, :answer, :category_id))
    @cardset = Cardset.find(params[:cardset_id])
    @card.assign_attributes(cardset_id: @cardset.id)
    if @card.save
      redirect_to cardset_path(@cardset)
    else
      render "new"
    end
  end

  def edit
    @card = Card.find(params[:id])
    @cardset = Cardset.find(params[:cardset_id])
  end

  def update
    @card = Card.find(params[:id])
    @cardset = Cardset.find(params[:cardset_id])

    if @card.update(params[:card].permit(:question, :answer, :category_id, :cardset_id, :visible))
      redirect_to cardset_path(@cardset)
    else
      render "edit"
    end
  end

  def destroy
    @card = Card.find(params[:id])
    @cardset = Cardset.find(params[:cardset_id])

    @card.destroy

    redirect_to cardset_path(@cardset)
  end

  def toggle_visible
    @card = Card.find(params[:id])
    @card.toggle(:visible)
    @card.save!
    render nothing: true
  end

  def set_visible
    @card = Card.find(params[:id])

    @card.update(params[:card].permit(:visible))
    render nothing: true
  end
end
