class CreateStores < ActiveRecord::Migration[6.0]
  def change
    create_table :stores do |t|
      t.string :name
      t.boolean :have_course
      t.datetime :deleted_at
      t.timestamps
    end
  end
end
