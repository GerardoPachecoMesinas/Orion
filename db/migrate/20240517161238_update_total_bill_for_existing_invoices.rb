class UpdateTotalBillForExistingInvoices < ActiveRecord::Migration[7.1]
  def up
    Invoice.find_each do |invoice|
      service_price = invoice.service_package.price || 0
      additional_amount = invoice.aditional_amount || 0
      total_bill = service_price + additional_amount
      invoice.update(total_bill: total_bill)
    end
  end

  def down
    Invoice.find_each do |invoice|
      invoice.update(total_bill: nil)
    end
  end
end
