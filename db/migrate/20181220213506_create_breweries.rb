class CreateBreweries < ActiveRecord::Migration[5.2]
  def change
    create_table :breweries do |t|
      t.string :name
      t.string :address
      t.string :contact_name
      t.string :phone
      t.string :email
      t.string :website

      t.timestamps
    end
  end
end
