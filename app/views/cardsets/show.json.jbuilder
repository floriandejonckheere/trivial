json.cards @cardset.cards do |card|
  json.id card.id
  json.question card.question
  json.answer card.answer
  json.category card.category.id
end
