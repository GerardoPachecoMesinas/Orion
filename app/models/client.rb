class Client < ApplicationRecord
  validates :name, presence: { :message => "no puede estar vacio"}
  validates :phone, presence: { :message => "no puede estar vacio"}
  validates :location, presence: { :message => "no puede estar vacio"}
end
