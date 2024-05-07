class Invoice < ApplicationRecord
  belongs_to :client
  belongs_to :service_package
end
