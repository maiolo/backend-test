class BillingInfo < ApplicationRecord
  belongs_to :buyer

  validates :doc_number, presence: true, uniqueness: { scope: :doc_type }
end
