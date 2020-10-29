# frozen_string_literal: true

FactoryBot.define do
  factory :category, class: "Category" do
    title { FFaker::Lorem.sentence(3) }
    color { Category::COLORS.sample }
  end
end
