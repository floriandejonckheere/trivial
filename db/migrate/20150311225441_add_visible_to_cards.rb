class AddVisibleToCards < ActiveRecord::Migration
  def change
    add_column :cards, :visible, :boolean, default: true
  end
end
