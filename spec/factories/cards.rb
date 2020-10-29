# frozen_string_literal: true

FactoryBot.define do
  factory :card, class: "Card" do
    question { "#{FFaker::Lorem.sentence(15)}?" }
    answer { FFaker::Lorem.sentence(5) }

    association :category, factory: :category
    association :cardset, factory: :cardset
  end
end
