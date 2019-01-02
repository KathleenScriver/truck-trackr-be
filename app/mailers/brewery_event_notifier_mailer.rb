class BreweryEventNotifierMailer < ApplicationMailer

    def self.broadcast_setup(all_food_truck_emails, brewery_event)
        all_food_truck_emails.each do |email|
            broadcast(email, brewery_event).deliver_now
        end
    end

    def broadcast(email, brewery_event)
        @brewery_event = brewery_event
        mail(to: email, subject: "New Event Posted")
    end
end
