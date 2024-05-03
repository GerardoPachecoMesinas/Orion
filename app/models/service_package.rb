class ServicePackage < ApplicationRecord
  has_many :clients
  has_many :invoices
end
