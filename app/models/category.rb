class Category < ActiveRecord::Base
  # has_many :cards

  validates :title, presence: true
  validates :color, presence: true
end
