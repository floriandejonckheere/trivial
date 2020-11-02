# frozen_string_literal: true

module API
  class CardsetsController < ApplicationController
    def show
      @cardset = cardset
    end

    private

    def cardset
      @cardset ||= Cardset.find(params[:id])
    end
  end
end
