class CreateRelations < ActiveRecord::Migration
  def change
    create_table :categories_quotes do |t|
    	t.belongs_to :category
    	t.belongs_to :quote
    end
  end
end
