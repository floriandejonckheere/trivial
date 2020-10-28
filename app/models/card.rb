# frozen_string_literal: true

class Card < ApplicationRecord
  belongs_to :category
  belongs_to :cardset

  validates :question, presence: true
  validates :answer, presence: true
  validates :category_id, presence: true
  validates :cardset_id, presence: true
end
