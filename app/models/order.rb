class Order < ApplicationRecord
  has_many :payments
  has_many :orders_items
  has_many :items, through: :orders_items
  has_one :shipping
  belongs_to :buyer
  

  validates_associated :payments
  validates_associated :orders_items
  validates_associated :items
  validates_associated :shipping
  validates_associated :buyer
  validates :total_amount, presence: true
  validates :total_shipping, presence: true
  validates :total_amount_with_shipping, presence: true
  validates :status, presence: true
  validates :date_created, presence: true
  validates :expiration_date, presence: true 
end
