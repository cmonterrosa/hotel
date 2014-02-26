class CreateTipoHabitacions < ActiveRecord::Migration
  def self.up
    create_table :tipo_habitacions do |t|
      t.string :descripcion, :limit => 120
      t.boolean :activa
    end
  end

  def self.down
    drop_table :tipo_habitacions
  end
end
