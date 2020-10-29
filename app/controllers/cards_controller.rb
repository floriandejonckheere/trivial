# frozen_string_literal: true

class CardsController < ApplicationController
  def new
    @card = Card.new
    @cardset = cardset
  end

  def create
    @card = Card.new(card_params.merge(cardset: cardset))
    @cardset = cardset

    if @card.save
      redirect_to cardset_path(@cardset)
    else
      render "new"
    end
  end

  def edit
    @card = card
    @cardset = cardset
  end

  def update
    @card = card
    @cardset = cardset

    if @card.update(card_params)
      redirect_to cardset_path(@cardset)
    else
      render "edit"
    end
  end

  def destroy
    @card = card
    @cardset = cardset

    @card.destroy

    redirect_to cardset_path(@cardset)
  end

  private

  def card_params
    params
      .require(:card)
      .permit(:question, :answer, :category_id)
  end

  def card
    @card ||= Card.find(params[:id])
  end

  def cardset
    @cardset ||= Cardset.find(params[:cardset_id])
  end
end
