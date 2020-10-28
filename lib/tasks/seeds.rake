# frozen_string_literal: true

namespace :seeds do
  desc "Generate seeds"
  task generate: :environment do
    # Generate example questions from opentdb.com

    amount = 10

    difficulties = {
      easy: "Easy difficulty",
      medium: "Moderate difficulty",
      hard: "Hard difficulty",
    }.freeze

    categories = {
      "9": "General Knowledge",
      "10": "Entertainment: Books",
      "11": "Entertainment: Film",
      "12": "Entertainment: Music",
      "14": "Entertainment: Television",
      "17": "Science & Nature",
      "20": "Mythology",
      "21": "Sports",
      "22": "Geography",
      "23": "History",
      "24": "Politics",
      "25": "Art",
      "27": "Animals",
      "28": "Vehicles",
    }.freeze

    file = File.open(Rails.root.join("db/seeds/development/02_cards.seeds.rb"), "w")

    file.write <<~HERE
      # frozen_string_literal: true
      
      ActiveRecord::Base.transaction do
        puts "-- Creating cardsets"

    HERE

    difficulties.each_value { |difficulty| file.write("  #{difficulty.downcase.parameterize(separator: '_')} = Cardset.find_by!(name: \"#{difficulty}\")\n") }
    file.write("\n")

    categories.each_value { |category| file.write("  #{category.downcase.parameterize(separator: '_')} = Category.find_by!(name: \"#{category}\")\n") }
    file.write("\n")

    ActiveRecord::Base.transaction do
      difficulties.each do |difficulty, difficulty_model|
        categories.each do |category, category_model|
          puts "Fetching #{amount} cards for category #{category_model} with difficulty #{difficulty_model}"

          uri = URI.parse("https://opentdb.com/api.php?amount=#{amount}&difficulty=#{difficulty}&type=multiple&category=#{category}")
          response = Net::HTTP.get_response(uri)

          json = JSON.parse(response.body)

          json.fetch("results").each do |result|
            question = CGI.unescapeHTML(result.fetch("question")).gsub("\"", "\\\"")
            answer = CGI.unescapeHTML(result.fetch("correct_answer")).gsub("\"", "\\\"")

            file.write("  Card.find_or_create_by!(category: #{category_model.downcase.parameterize(separator: '_')}, cardset: #{difficulty_model.downcase.parameterize(separator: '_')}, question: \"#{question}\", answer: \"#{answer}\")\n")
          end

          file.write("\n")

          sleep 1
        end
      end
    end

    file.write "end\n"
    file.close
  end
end
