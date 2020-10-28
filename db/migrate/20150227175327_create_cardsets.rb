# frozen_string_literal: true

class CreateCardsets < ActiveRecord::Migration
  def change
    create_table :cardsets do |t|
      t.text :title

      t.timestamps null: false
    end
  end
end
