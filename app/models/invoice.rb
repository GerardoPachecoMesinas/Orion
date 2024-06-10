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

  def active?
    Time.current < finished_at
  end

  def unpaid?
    payment_status != "Pagado"
  end
end
