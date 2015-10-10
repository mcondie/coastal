class AddHomepageToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :homepage, :boolean
  end
end
