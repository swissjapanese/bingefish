class AddTraktToShows < ActiveRecord::Migration[5.0]
  def change
    add_column :shows, :trakt, :integer
  end
end
