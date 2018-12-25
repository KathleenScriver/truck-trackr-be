class FixColumnNamePhone < ActiveRecord::Migration[5.2]
  def change
    rename_column :food_trucks, :phone_number, :phone
  end
end
