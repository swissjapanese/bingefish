class CreateShowImages < ActiveRecord::Migration
  def change
    create_table :show_images do |t|
      t.text :image_type
      t.text :image
      t.integer :show_id

      t.timestamps null: false
    end
  end
end
