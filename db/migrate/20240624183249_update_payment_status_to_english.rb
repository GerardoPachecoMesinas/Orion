class UpdatePaymentStatusToEnglish < ActiveRecord::Migration[7.1]
  def up
    Invoice.where(payment_status: ["pendiente", "Pendiente", nil]).update_all(payment_status: "pending")
    Invoice.where(payment_status: ["parcialmente pagado", "Parcialmente Pagado"]).update_all(payment_status: "partially paid")
    Invoice.where(payment_status: ["pagado", "Pagado"]).update_all(payment_status: "paid")
  end

  def down
    Invoice.where(payment_status: "pending").update_all(payment_status: "pendiente")
    Invoice.where(payment_status: "partially paid").update_all(payment_status: "parcialmente pagado")
    Invoice.where(payment_status: "paid").update_all(payment_status: "pagado")
  end
end
