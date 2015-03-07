class PresentationController < ApplicationController

  def show
    @cardset = Cardset.find(params[:cardset_id])
    @category = Category.find(params[:id])
    respond_to :html
  end

end
