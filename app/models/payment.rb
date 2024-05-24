class Payment < ApplicationRecord
  belongs_to :invoice
  validates :paid_at, presence: { message: "no puede estar vacio" }
  validates :amount, presence: { message: "no puede estar vacio" }
  validates :method, presence: { message: "no puede estar vacio" }
end
