json.extract! payment, :id, :paid_at, :amount, :method, :notes, :invoice_id, :created_at, :updated_at
json.url payment_url(payment, format: :json)
