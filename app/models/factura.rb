class Factura < ApplicationRecord
  belongs_to :user
  validates :amount, presence: true
end
