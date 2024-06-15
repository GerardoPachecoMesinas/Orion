class Invoice < ApplicationRecord
  belongs_to :client
  belongs_to :service_package
  has_many :payments, dependent: :destroy

  validates :started_at, presence: { message: "no puede estar vacio" }
  validates :disconnected_at, presence: { message: "no puede estar vacio" }
  validates :finished_at, presence: { message: "no puede estar vacio" }

  scope :active, -> { where(finished_at: Time.current..) }
  scope :unpaid, -> { where.not(payment_status: "Pagado") }
  scope :pending, -> { active.or(unpaid) }

  before_save :set_payment_status

  PAYMENT_STATUSES = ["Pendiente", "Parcialmente Pagado", "Pagado"]

  def set_payment_status
    total_payments = payments.sum(:amount)
    if total_payments <= 0
      self.payment_status = PAYMENT_STATUSES[0]
    elsif total_payments < total_bill
      self.payment_status = PAYMENT_STATUSES[1]
    else
      self.payment_status = PAYMENT_STATUSES[2]
    end
  end

  def active?
    Time.current < finished_at
  end

  def unpaid?
    payment_status != "Pagado"
  end
end
