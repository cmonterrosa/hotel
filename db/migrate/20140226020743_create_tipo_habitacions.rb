class CreateTipoHabitacions < ActiveRecord::Migration
  def self.up
    create_table :tipo_habitacions do |t|
      t.string :descripcion, :limit => 120
      t.boolean :activa
    end
    TipoHabitacion.create(:descripcion => "RESIDENCIA", :activa => true)
    TipoHabitacion.create(:descripcion => "DOBLE", :activa => true)
    TipoHabitacion.create(:descripcion => "SENCILLA", :activa => true)
  end

  def self.down
    drop_table :tipo_habitacions
  end
end
