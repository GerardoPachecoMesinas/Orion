module ClientsHelper
  def active_invoice?(invoice)
    Time.current < invoice.finished_at || invoice.payment_status != "Pagado"
  end
end
