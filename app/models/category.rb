# frozen_string_literal: true

class Category < ApplicationRecord
  COLORS = %w(
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
  ).freeze

  has_many :cards,
           dependent: :destroy

  validates :title,
            presence: true

  validates :color,
            presence: true,
            inclusion: { in: COLORS }
end
