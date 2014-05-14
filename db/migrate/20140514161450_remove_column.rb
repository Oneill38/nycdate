class RemoveColumn < ActiveRecord::Migration
  def change
    remove_column :users, :login, :string
  end
end
