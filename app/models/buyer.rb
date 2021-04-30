class Buyer < ApplicationRecord
  has_many :phones
  has_many :billing_infos
  has_many :orders
  has_many :payments
end
