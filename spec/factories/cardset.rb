# frozen_string_literal: true

FactoryBot.define do
  factory :cardset, class: "Cardset" do
    title { FFaker::Lorem.sentence(3) }
  end
end
