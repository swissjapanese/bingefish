class RemoveSeriesIdIndexFromShow < ActiveRecord::Migration
  def change
    remove_index(:shows, name: 'SeriesID')
  end
end
