class Item < ApplicationRecord
  has_many :orders, throught: :orders_items 
end
