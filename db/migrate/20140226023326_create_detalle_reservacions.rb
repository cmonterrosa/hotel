class CreateDetalleReservacions < ActiveRecord::Migration
  def self.up
    create_table :detalle_reservacions do |t|
      t.integer :reservacion_id
      t.integer :habitacion_id
      t.datetime :fechahora_inicial
      t.datetime :fechahora_final
      t.boolean :activa
    end
  end

  def self.down
    drop_table :detalle_reservacions
  end
end
