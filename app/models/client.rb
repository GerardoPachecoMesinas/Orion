class Client < ApplicationRecord
  validates :Nombre, presence: { :message => "no puede estar vacio"}
  validates :Fecha_de_pago, presence: { :message => "no puede estar vacio"}
  validates :Fecha_de_corte, presence: { :message => "no puede estar vacio"}
  validates :Teléfono, presence: { :message => "no puede estar vacio"}
  validates :Localidad, presence: { :message => "no puede estar vacio"}
end
