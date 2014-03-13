class DetalleReservacion < ActiveRecord::Base
  belongs_to :reservacion
  belongs_to :habitacion
end
