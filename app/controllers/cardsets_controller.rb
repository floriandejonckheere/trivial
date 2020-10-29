# frozen_string_literal: true

class CardsetsController < ApplicationController
  before_action :authenticate_user!

  def index; end

  def new
    @cardset = Cardset.new
  end

  def create
    @cardset = Cardset.new(cardset_params)

    if @cardset.save
      redirect_to cardsets_path
    else
      render "new"
    end
  end

  def edit
    @cardset = cardset
  end

  def update
    @cardset = cardset

    if @cardset.update(cardset_params)
      redirect_to cardsets_path
    else
      render "edit"
    end
  end

  def destroy
    @cardset = cardset
    @cardset.destroy

    redirect_to cardsets_path
  end

  def show
    @cardset = cardset
  end

  private

  def cardset_params
    params
      .require(:cardset)
      .permit(:title)
  end

  def cardset
    @cardset ||= Cardset.find(params[:id])
  end
end
