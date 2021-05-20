class CreateVehicles < ActiveRecord::Migration[6.1]
  def change
    create_table :vehicles do |t|
      t.string :license_plate, null: false
      t.string :make, null: false
      t.string :model, null: false
      t.string :color, null: false
      t.string :category, null: false
      t.string :vin, null: false

      t.timestamps
    end
  end
end
