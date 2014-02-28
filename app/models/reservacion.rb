class Reservacion < ActiveRecord::Base
  has_many :detalle_reservacions

   def generar_folio_reservacion!
     unless self.folio
        anio = self.anio
        maximo=  Reservacion.maximum(:folio, :conditions => ["anio = ?", anio])
        folio = 1 unless maximo
        folio ||= maximo.to_i + 1
        self.update_attributes!(:folio => folio) if folio
     end
   end

   def numero_folio
     (self.folio) ?  "#{self.folio.to_s.rjust(4, '0')}/#{self.anio}" : nil
   end

end
