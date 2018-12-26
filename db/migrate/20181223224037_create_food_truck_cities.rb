class CreateFoodTruckCities < ActiveRecord::Migration[5.2]
  def change
    create_table :food_truck_cities do |t|
      t.references :food_truck, foreign_key: true
      t.references :city, foreign_key: true

      t.timestamps
    end
  end
end
