class AddWebsiteColumnToFoodTrucks < ActiveRecord::Migration[5.2]
  def change
    add_column :food_trucks, :website, :string
  end
end
