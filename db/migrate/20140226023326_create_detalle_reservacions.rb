class CreateDetalleReservacions < ActiveRecord::Migration
  def self.up
    create_table :detalle_reservacions do |t|
      t.integer :reservacion_id
      t.integer :habitacion_id
      t.date :fecha_inicial
      t.integer :hora_inicial
      t.date :fecha_final
      t.integer :hora_final
      t.timestamps
      t.boolean :activa
    end

    add_index :detalle_reservacions, :reservacion_id, :name => "reservacion"

  end

  def self.down
    drop_table :detalle_reservacions
  end
end
