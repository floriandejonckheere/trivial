# frozen_string_literal: true

json.categories Category.all do |category|
  json.id category.id
  json.title category.title
  json.color category.color
end
