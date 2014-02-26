class Reservacion < ActiveRecord::Base
  has_many :detalles

end
