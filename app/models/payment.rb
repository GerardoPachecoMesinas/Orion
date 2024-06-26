class Payment < ApplicationRecord
  belongs_to :invoice
  validates :paid_at, presence: { message: "no puede estar vacio" }
  validates :amount, presence: { message: "no puede estar vacio" }
  validates :method, presence: { message: "no puede estar vacio" }

  after_save :add_payment_to_invoice
  after_destroy :remove_payment_from_invoice

  private
  def add_payment_to_invoice
    invoice.set_payment_status
    invoice.save
  end

  def remove_payment_from_invoice
    invoice.reset_payment_status
    invoice.save
  end
end
