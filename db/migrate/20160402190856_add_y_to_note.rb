class AddYToNote < ActiveRecord::Migration
  def change
    add_column :notes, :y, :decimal
  end
end
