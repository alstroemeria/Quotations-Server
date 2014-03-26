class RemoveHasMany < ActiveRecord::Migration
  def change
    drop_table :categories_quotes
    add_column :quotes, :category_id, :integer
  end
end
