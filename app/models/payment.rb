class Payment < ApplicationRecord
  belongs_to :invoice
  validates :paid_at, presence: { message: "no puede estar vacio" }
  validates :amount, presence: { message: "no puede estar vacio" }
  validates :method, presence: { message: "no puede estar vacio" }

  after_save :update_invoice_payment_status

  private

  def update_invoice_payment_status
    invoice.set_payment_status
    invoice.save
  end
end
