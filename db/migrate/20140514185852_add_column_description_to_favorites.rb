class AddColumnDescriptionToFavorites < ActiveRecord::Migration
  def change
    add_column :favorites, :description, :text
  end
end
