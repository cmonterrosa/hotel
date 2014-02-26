class CreateHabitacions < ActiveRecord::Migration
  def self.up
    create_table :habitacions do |t|
      t.integer :capacidad
      t.integer :tipo_habitacion_id
      t.string :descripcion, :limit => 100
    end

  ## Habitaciones por defecto ####
  residencia = TipoHabitacion.find_by_descripcion("RESIDENCIA")
  doble = TipoHabitacion.find_by_descripcion("DOBLE")
  sencilla = TipoHabitacion.find_by_descripcion("SENCILLA")

  ### Residencias ###
  Habitacion.create(:capacidad => 2, :tipo_habitacion_id => residencia, :descripcion => "RESIDENCIA 1")
  Habitacion.create(:capacidad => 2, :tipo_habitacion_id => residencia, :descripcion => "RESIDENCIA 2")
  Habitacion.create(:capacidad => 2, :tipo_habitacion_id => residencia, :descripcion => "RESIDENCIA 3")
  Habitacion.create(:capacidad => 2, :tipo_habitacion_id => residencia, :descripcion => "RESIDENCIA 4")
  Habitacion.create(:capacidad => 2, :tipo_habitacion_id => residencia, :descripcion => "RESIDENCIA 5")
  Habitacion.create(:capacidad => 2, :tipo_habitacion_id => residencia, :descripcion => "RESIDENCIA 6")
  
  ## Dobles ###
  Habitacion.create(:capacidad => 2, :tipo_habitacion_id => doble , :descripcion => "DOBLE 1")
  Habitacion.create(:capacidad => 2, :tipo_habitacion_id => doble , :descripcion => "DOBLE 2")
  Habitacion.create(:capacidad => 2, :tipo_habitacion_id => doble , :descripcion => "DOBLE 3")
  Habitacion.create(:capacidad => 2, :tipo_habitacion_id => doble , :descripcion => "DOBLE 4")
  Habitacion.create(:capacidad => 2, :tipo_habitacion_id => doble , :descripcion => "DOBLE 5")
  Habitacion.create(:capacidad => 2, :tipo_habitacion_id => doble , :descripcion => "DOBLE 6")



  end

  def self.down
    drop_table :habitacions
  end
end
