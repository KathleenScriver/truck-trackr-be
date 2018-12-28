class CreateOpenDates < ActiveRecord::Migration[5.2]
  def change
    create_table :open_dates do |t|
      t.date :date
      t.boolean :booked?
      t.references :food_truck, foreign_key: true

      t.timestamps
    end
  end
end
