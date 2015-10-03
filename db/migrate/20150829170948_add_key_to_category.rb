class AddKeyToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :key, :string
  end
end
