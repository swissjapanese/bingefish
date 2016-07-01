class AddPopularityRankToShows < ActiveRecord::Migration
  def change
    add_column :shows, :popularity_rank, :integer
    add_column :shows, :tvdb_id, :integer
  end
end
