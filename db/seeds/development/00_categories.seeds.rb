# frozen_string_literal: true

ActiveRecord::Base.transaction do
  puts "-- Creating categories"

  Category.find_or_create_by!(title: "General Knowledge", color: "red")
  Category.find_or_create_by!(title: "Entertainment: Books", color: "pink")
  Category.find_or_create_by!(title: "Entertainment: Film", color: "purple")
  Category.find_or_create_by!(title: "Entertainment: Music", color: "indigo")
  Category.find_or_create_by!(title: "Entertainment: Television", color: "blue")
  Category.find_or_create_by!(title: "Science & Nature", color: "cyan")
  Category.find_or_create_by!(title: "Mythology", color: "teal")
  Category.find_or_create_by!(title: "Sports", color: "green")
  Category.find_or_create_by!(title: "Geography", color: "lime")
  Category.find_or_create_by!(title: "History", color: "yellow")
  Category.find_or_create_by!(title: "Politics", color: "amber")
  Category.find_or_create_by!(title: "Animals", color: "brown")
  Category.find_or_create_by!(title: "Vehicles", color: "grey")
end
