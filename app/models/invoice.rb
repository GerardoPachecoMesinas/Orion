class Invoice < ApplicationRecord
  belongs_to :client
  belongs_to :service_package
  has_many :payments, dependent: :destroy

  validates :started_at, presence: { message: "no puede estar vacio" }
  validates :disconnected_at, presence: { message: "no puede estar vacio" }
  validates :finished_at, presence: { message: "no puede estar vacio" }

  before_save :set_payment_status

  def set_payment_status
    total_payments = payments.sum(:amount)
    if total_payments <= 0
      self.payment_status = "Pendiente"
    elsif total_payments < total_bill
      self.payment_status = "Parcialmente Pagado"
    else
      self.payment_status = "Pagado"
    end
  end

  scope :active, -> { where("finished_at > ? OR payment_status != ?", Time.current, "Pagado") }

end
