class AdduidToBreweriesAndFoodTruck < ActiveRecord::Migration[5.2]
  def change
    add_column :food_trucks, :uid, :string
    add_column :breweries, :uid, :string
  end
end
