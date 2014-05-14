class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.string :image_url
      t.string :title
      t.string :url
      t.string :price
      t.string :venue_address
      t.string :city_name
      t.string :region_name
      t.string :start_time
    end
  end
end
