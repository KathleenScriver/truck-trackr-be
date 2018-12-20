class CreateTruckCities < ActiveRecord::Migration[5.2]
  def change
    create_table :truck_cities do |t|
      t.string :city
      t.references :food_truck, foreign_key: true

      t.timestamps
    end
  end
end
