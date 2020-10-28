# frozen_string_literal: true

class PresentationController < ApplicationController
  layout "presentation"

  def show
    @cardset = Cardset.find(params[:cardset_id])
    @categories = Category.find(@cardset.cards.pluck(:category_id).uniq)
    respond_to :html
  end
end
