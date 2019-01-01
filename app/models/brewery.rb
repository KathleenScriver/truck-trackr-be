class Brewery < ApplicationRecord
  has_many :brewery_events, dependent: :destroy
  validates_presence_of :name,
                        :address,
                        :contact_name,
                        :phone,
                        :email
end
