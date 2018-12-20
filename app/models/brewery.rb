class Brewery < ApplicationRecord
  validates_presence_of :name,
                        :address,
                        :contact_name,
                        :phone,
                        :email
end
