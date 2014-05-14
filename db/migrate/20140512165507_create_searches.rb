class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :title
      t.string :url
      t.text :description
      t.string :address
      t.string :city_name
      t.string :region_name
      t.datetime :start_time
      t.integer :user_id
      t.timestamps
    end
  end
end

