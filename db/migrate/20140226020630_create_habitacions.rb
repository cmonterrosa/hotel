class CreateHabitacions < ActiveRecord::Migration
  def self.up
    create_table :habitacions do |t|
      t.integer :capacidad
      t.integer :tipo_habitacion_id
      t.string :descripcion, :limit => 100
    end
  end

  def self.down
    drop_table :habitacions
  end
end
