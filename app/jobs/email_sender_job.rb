class EmailSenderJob < ApplicationJob
  queue_as :default

  def perform(all_food_truck_emails, brewery_event)
    BreweryEventNotifierMailer.broadcast_setup(all_food_truck_emails, brewery_event)
  end
end
