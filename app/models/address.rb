class Address < ApplicationRecord
  has_many :shippings

  validates :address_line, presence: true
  validates :street_number, presence: true
  validates :street_name, presence: true
  validates :comments, presence: true
  validates :zipcode, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :country, presence: true
  validates :neighborhood, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :receiver_phone, presence: true
end
