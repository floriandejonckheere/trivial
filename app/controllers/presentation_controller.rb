class PresentationController < ApplicationController

  layout "presentation"

  def show
    @cardset = Cardset.find(params[:cardset_id])
    @category = Category.find(params[:category_id])
    respond_to :html
  end

end
