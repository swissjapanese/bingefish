class CreateEpisodes < ActiveRecord::Migration
  def change
    create_table :episodes do |t|
      t.integer :show_id
      t.integer :season_id
      t.integer :number

      t.timestamps null: false
    end
  end
end
