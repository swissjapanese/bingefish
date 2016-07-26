class AddImagesToShows < ActiveRecord::Migration[5.0]
  def change
    add_column :shows, :poster, :text
    add_column :shows, :banner, :text
    add_column :shows, :clearart, :text
    add_column :shows, :logo, :text
  end
end
