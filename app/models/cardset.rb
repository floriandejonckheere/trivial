# frozen_string_literal: true

class Cardset < ApplicationRecord
  has_many :cards,
           dependent: :destroy

  validates :title,
            presence: true
end

# == Schema Information
#
# Table name: cardsets
#
#  id         :bigint           not null, primary key
#  title      :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
