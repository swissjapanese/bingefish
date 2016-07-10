class AddFanartToShow < ActiveRecord::Migration
  def change
    add_column :shows, :fanart, :text
  end
end
