class CreateSeasons < ActiveRecord::Migration
  def change
    create_table :seasons do |t|
      t.integer :show_id
      t.integer :number

      t.timestamps null: false
    end
  end
end
