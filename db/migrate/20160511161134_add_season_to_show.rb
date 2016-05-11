class AddSeasonToShow < ActiveRecord::Migration
  def change
    add_column :shows, :season, :text
    add_column :shows, :episode, :text
    add_column :shows, :series_id, :text
  end
end
