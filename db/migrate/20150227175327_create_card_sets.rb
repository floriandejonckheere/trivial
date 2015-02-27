class CreateCardSets < ActiveRecord::Migration
  def change
    create_table :card_sets do |t|
      t.text :title

      t.timestamps null: false
    end
  end
end
