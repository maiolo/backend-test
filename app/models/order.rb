class Order < ApplicationRecord
  has_many :payments
  has_many :items, throught: :orders_items
  has_one :shipping
  has_one :buyer
  
end
