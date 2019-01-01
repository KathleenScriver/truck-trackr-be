class Brewery < ApplicationRecord
  has_many :brewery_events
  validates_presence_of :name,
                        :address,
                        :contact_name,
                        :phone,
                        :email
  validates :uid, presence: true, uniqueness: true 
end
