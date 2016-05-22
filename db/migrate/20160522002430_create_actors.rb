class CreateActors < ActiveRecord::Migration
  def change
    create_table :actors do |t|
      t.text :first_name
      t.text :middle_name
      t.text :last_name
      t.text :photo

      t.timestamps null: false
    end
  end
end
