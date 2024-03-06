class Client < ApplicationRecord
  has_one :service
  validates :name, presence: { :message => "no puede estar vacio"}
  validates :phone, presence: { :message => "no puede estar vacio"}
  validates :location, presence: { :message => "no puede estar vacio"}
end
