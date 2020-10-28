# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :cards, dependent: :destroy

  def self.colors
    %w(
      red
      pink
      purple
      deep-purple
      indigo
      blue
      light-blue
      cyan
      teal
      green
      light-green
      lime
      yellow
      amber
      orange
      deep-orange
      brown
      grey
      blue-grey
    )
  end

  validates :title, presence: true
  validates :color, presence: true
end
