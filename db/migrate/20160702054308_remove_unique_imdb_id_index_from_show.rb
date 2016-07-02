class RemoveUniqueImdbIdIndexFromShow < ActiveRecord::Migration
  def change
    remove_index(:shows, name: 'IMDB_ID')
    add_index(:shows, 'imdb_id', name: 'IMDB_ID')
  end
end
