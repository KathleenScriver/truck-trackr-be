class CreateFoodTrucks < ActiveRecord::Migration[5.2]
  def change
    create_table :food_trucks do |t|
      t.string :name
      t.string :food_type
      t.string :contact_name
      t.string :phone_number
      t.string :email
      t.string :logo_image

      t.timestamps
    end
  end
end
