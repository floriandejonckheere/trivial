class CardsetsController < ApplicationController

  def index
    @cardsets = CardSet.all
  end

  def new
    @categories = Category.all
  end

end
