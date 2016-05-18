class CreateJwtTokens < ActiveRecord::Migration
  def change
    create_table :jwt_tokens do |t|
      t.text :token
      t.date :expiration_date

      t.timestamps null: false
    end
  end
end
