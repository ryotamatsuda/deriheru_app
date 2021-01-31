class CreateDrivers < ActiveRecord::Migration[6.0]
  def change
    create_table :drivers do |t|
      t.string :name
      t.string :line_id
      t.string :email
      t.integer :wage
      t.string :gasoline
      t.time :attende_at
      t.string :type_of_car
      t.string :car_number
      t.string :memo
      t.integer :phone_number
      t.datetime :deleted_at
      t.timestamps
    end
  end
end
