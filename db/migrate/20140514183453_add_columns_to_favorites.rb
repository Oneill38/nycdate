class AddColumnsToFavorites < ActiveRecord::Migration
  def change
    add_column :favorites, :user_id, :integer
    add_column :favorites, :created_at, :datetime
    add_column :favorites, :updated_at, :datetime
  end
end
