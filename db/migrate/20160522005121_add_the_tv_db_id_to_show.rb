class AddTheTvDbIdToShow < ActiveRecord::Migration
  def change
    add_column :shows, :tvdb_id, :integer
  end
end
