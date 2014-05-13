class AddCountToFavorites < ActiveRecord::Migration
  def change
    remove_column :favorites, :users_id
    remove_column :favorites, :quotes_id
    add_column :favorites, :count, :integer
    add_column :favorites, :quote_id, :integer
  end
end
