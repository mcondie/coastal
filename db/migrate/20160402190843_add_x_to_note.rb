class AddXToNote < ActiveRecord::Migration
  def change
    add_column :notes, :x, :decimal
  end
end
