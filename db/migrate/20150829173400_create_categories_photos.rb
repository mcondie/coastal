class CreateCategoriesPhotos < ActiveRecord::Migration
  def change
    create_table :categories_photos do |t|
      t.references :category, index: true, foreign_key: true
      t.references :photo, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
