# frozen_string_literal: true

class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.text :question
      t.text :answer
      t.references :category, index: true
      t.references :cardset, index: true

      t.timestamps null: false
    end
    add_foreign_key :cards, :categories
    add_foreign_key :cards, :cardsets
  end
end
