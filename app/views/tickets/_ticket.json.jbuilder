json.extract! ticket, :id, :created_at, :status, :priority_level, :description, :client_id, :created_at, :updated_at
json.url ticket_url(ticket, format: :json)
