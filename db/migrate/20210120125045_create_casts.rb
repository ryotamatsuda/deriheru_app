class CreateCasts < ActiveRecord::Migration[6.0]
  def change
    create_table :casts do |t|
      t.string :name
      t.string :line_id
      t.string :email
      t.integer :store_id
      t.date :entryed_at
      t.integer :course # enum
      t.string :phone_number
      t.datetime :deleted_at
      t.timestamps
    end
  end
end
