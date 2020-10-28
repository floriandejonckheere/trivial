# frozen_string_literal: true

class RemoveVisibleFromCards < ActiveRecord::Migration
  def change
    remove_column :cards, :visible, :boolean
  end
end
