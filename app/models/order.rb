class Order < ApplicationRecord
  has_many :payments
  has_many :orders_items
  has_many :items, through: :orders_items
  has_one :shipping
  belongs_to :buyer
  
end
