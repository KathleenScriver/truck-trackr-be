class CreateBreweryEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :brewery_events do |t|
      t.date :date
      t.boolean :truck_booked?, default: false
      t.references :brewery, foreign_key: true

      t.timestamps
    end
  end
end
