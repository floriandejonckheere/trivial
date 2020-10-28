# frozen_string_literal: true

ActiveRecord::Base.transaction do
  puts "-- Creating cardsets"

  Cardset.create!(title: "Easy difficulty")
  Cardset.create!(title: "Moderate difficulty")
  Cardset.create!(title: "Hard difficulty")
end
