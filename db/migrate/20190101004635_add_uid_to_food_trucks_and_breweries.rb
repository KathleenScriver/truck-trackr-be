class AddUidToFoodTrucksAndBreweries < ActiveRecord::Migration[5.2]
  def change
    add_column :food_trucks, :uid, :bigint
    add_column :breweries, :uid, :bigint
  end
end
