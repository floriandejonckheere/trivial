class Card < ActiveRecord::Base
  belongs_to :category
  belongs_to :cardset
end
