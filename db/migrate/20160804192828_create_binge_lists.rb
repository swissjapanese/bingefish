class CreateBingeLists < ActiveRecord::Migration[5.0]
  def change
    create_table :binge_lists do |t|
      t.integer :user_id
      t.string :show_id
      t.string :integer
      t.boolean :binge, default: false
      t.boolean :watchlist, default: false
      t.boolean :guilty, default: false
      t.boolean :updated, default: false

      t.timestamps
    end
  end
end
