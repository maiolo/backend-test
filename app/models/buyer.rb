class Buyer < ApplicationRecord
  has_many :phones
  has_many :billing_infos
  has_many :orders
  has_many :payments

  validates :nickname, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
end
