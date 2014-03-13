class Habitacion < ActiveRecord::Base
  has_many :detalle_reservacions
end
