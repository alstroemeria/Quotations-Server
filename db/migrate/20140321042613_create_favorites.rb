class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.belongs_to :users
      t.belongs_to :quotes
      t.timestamps
    end
  end
end
