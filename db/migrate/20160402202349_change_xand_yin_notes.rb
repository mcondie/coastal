class ChangeXandYinNotes < ActiveRecord::Migration
  def change
  	change_column :notes, :x, :text
  	change_column :notes, :y, :text
  end
end
