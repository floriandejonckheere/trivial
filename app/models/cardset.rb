class Cardset < ApplicationRecord
  has_many :cards, :dependent => :destroy

  validates :title, presence: true
end
