class Phone < ApplicationRecord
  belongs_to :buyer

  validates :buyer_id, presence: true
  validates :area_code, presence: true
  validates :number, presence: true
end
