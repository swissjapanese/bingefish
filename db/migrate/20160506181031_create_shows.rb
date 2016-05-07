class CreateShows < ActiveRecord::Migration
  def change
    create_table :shows do |t|
      t.text :imdb_id
      t.text :title
      t.integer :year
      t.text :rating
      t.text :runtime
      t.text :genre
      t.text :release
      t.text :director
      t.text :writer
      t.text :cast
      t.text :metacritic
      t.text :imdb_rating
      t.text :imdb_votes
      t.text :poster
      t.text :plot
      t.text :full_plot
      t.text :language
      t.text :country
      t.text :awards
      t.text :last_updated
      t.text :show_type

      t.timestamps null: false
    end
  end
end
