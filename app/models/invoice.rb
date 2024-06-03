class Invoice < ApplicationRecord
  belongs_to :client
  belongs_to :service_package
  has_many :payments, dependent: :destroy

  validates :started_at, presence: { message: "no puede estar vacio" }
  validates :disconnected_at, presence: { message: "no puede estar vacio" }
  validates :finished_at, presence: { message: "no puede estar vacio" }

  before_save :update_payment_status

  def update_payment_status
    total_payments = payments.sum(:amount)
    if total_payments >= total_bill
      self.payment_status = "Pagado"
    elsif total_payments < total_bill && total_payments > 0
      self.payment_status = "Parcialmente Pagado"
    else
      self.payment_status = "Pendiente"
    end
  end
end
