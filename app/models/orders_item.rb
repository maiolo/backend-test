class OrdersItem < ApplicationRecord
  belongs_to :order
  belongs_to :item

  validates :order, uniquess: { scope: :item }
end
