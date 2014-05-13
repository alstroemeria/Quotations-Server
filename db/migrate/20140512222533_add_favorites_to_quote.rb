class AddFavoritesToQuote < ActiveRecord::Migration
  def change
    add_column :quotes, :favorites, :integer
  end
end
