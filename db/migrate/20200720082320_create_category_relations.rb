class CreateCategoryRelations < ActiveRecord::Migration[5.2]
  def change
    create_table :category_relations do |t|
      t.references :humster, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
