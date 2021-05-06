class Shipping < ApplicationRecord
  belongs_to :order
  belongs_to :address

  validates :shipment_type, presence: true
  validates :date_created, presence: true
  validates :address, presence: true
end
