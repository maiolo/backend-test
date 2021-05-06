class Store < ApplicationRecord

  validates :name, uniqueness: { scope: :location }
end
