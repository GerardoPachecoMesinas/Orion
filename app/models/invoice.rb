class Invoice < ApplicationRecord
  belongs_to :client
  belongs_to :service_package
  has_many :payments, dependent: :destroy

  validates :started_at, presence: { message: "no puede estar vacio" }
  validates :disconnected_at, presence: { message: "no puede estar vacio" }
  validates :finished_at, presence: { message: "no puede estar vacio" }

  scope :active, -> { where(finished_at: Time.current..) }
  scope :unpaid, -> { where.not(payment_status: "paid") }
  scope :showing, -> { active.or(unpaid) }

  before_save :update_payment_status

  state_machine :payment_status, initial: :pending do
    state :pending
    state :partially_paid
    state :paid

    event :add_payment do
      transition [:pending, :partially_paid] => :partially_paid, if: ->(invoice) { invoice.total_payments > 0 && invoice.total_payments < invoice.total_bill }
      transition [:pending, :partially_paid] => :paid, if: ->(invoice) { invoice.total_payments >= invoice.total_bill }
    end
    event :remove_payment do
      transition [:paid, :partially_paid] => :partially_paid, if: ->(invoice) { invoice.total_payments > 0 && invoice.total_payments < invoice.total_bill }
      transition [:paid, :partially_paid] => :pending, if: ->(invoice) { invoice.total_payments <= 0 }
    end
  end

  def total_payments
    payments.sum(:amount)
  end

  def set_payment_status
    add_payment
  end

  def reset_payment_status
    remove_payment
  end

  def update_payment_status
    if total_payments >= total_bill
      self.payment_status = "paid" unless payment_status == "paid "
    elsif total_payments > 0
      self.payment_status = "partially paid" unless payment_status == "partially paid"
    else
      self.payment_status = "pending" unless payment_status == "pending"
    end
  end

  def payment_status_in_spanish
    snake_payment_status = payment_status.gsub(" ", "_")
    I18n.t("activerecord.attributes.invoice.payment_statuses.#{snake_payment_status}")
  end

  def active?
    Time.current < finished_at
  end

  def unpaid?
    payment_status != "paid"
  end
end
