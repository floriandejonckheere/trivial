# frozen_string_literal: true

class Card < ApplicationRecord
  belongs_to :category
  belongs_to :cardset

  validates :question,
            presence: true

  validates :answer,
            presence: true
end

# == Schema Information
#
# Table name: cards
#
#  id          :bigint           not null, primary key
#  answer      :text
#  question    :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  cardset_id  :integer
#  category_id :integer
#
# Indexes
#
#  index_cards_on_cardset_id   (cardset_id)
#  index_cards_on_category_id  (category_id)
#
