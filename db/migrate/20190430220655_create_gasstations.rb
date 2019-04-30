class CreateGasstations < ActiveRecord::Migration[5.2]
  def change
    create_table :gasstations do |t|
      t.string :brand
      t.float :price
      t.float :lat
      t.float :lon

      t.timestamps
    end
  end
end
