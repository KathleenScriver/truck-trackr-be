class ChangeBookedToHaveDefaultInOpenDates < ActiveRecord::Migration[5.2]
  def change
    change_column :open_dates, :booked?, :boolean, :default => false
  end
end
