class Address < ApplicationRecord
  has_many :shippings

  validates :address_line, presence: true
  validates :street_number, presence: true
  validates :street_name, presence: true
  validates :comment, presence: true
  validates :zip_code, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :country_id, presence: true
  validates :country_name, presence: true
  validates :neighborhood, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :receiver_phone, presence: true
end
