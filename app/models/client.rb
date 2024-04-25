class Client < ApplicationRecord
  has_many :invoices, dependent: :destroy
  has_many :tickets, dependent: :destroy
  validates :name, presence: { :message => "no puede estar vacio"}
  validates :phone, presence: { :message => "no puede estar vacio"}
  validates :location, presence: { :message => "no puede estar vacio"}
end
