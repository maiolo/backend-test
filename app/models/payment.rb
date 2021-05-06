class Payment < ApplicationRecord
  belongs_to :order
  belongs_to :buyer

  validates :installments, presence: true
  validates :payment_type, presence: true
  validates :status, presence: true
  validates :transaction_amount, presence: true
  validates :taxes_amount, presence: true
  validates :shipping_cost, presence: true
  validates :total_paid_amount, presence: true
  validates :installment_amount, presence: true
  validates :date_approved, presence: true
  validates :date_created, presence: true
end
