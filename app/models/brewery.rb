class Brewery < ApplicationRecord
  has_many :brewery_events, dependent: :destroy
  validates_presence_of :name,
                        :address,
                        :contact_name,
                        :phone,
                        :email
  validates :uid, presence: true, uniqueness: true

  mount_uploader :logo_image, LogoUploader
end
