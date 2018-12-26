class DropTruckCities < ActiveRecord::Migration[5.2]
  def change
    drop_table :truck_cities
  end
end
