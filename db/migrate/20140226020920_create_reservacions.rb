class CreateReservacions < ActiveRecord::Migration
  def self.up
    create_table :reservacions do |t|
      t.string :anio, :limit => 4
      t.string :folio, :limit => 4
      t.string :nombre, :limit => 60
      t.string :rfc, :limit => 13
      t.string :direccion, :limit => 60
      t.string :procedencia, :limit => 60
      t.string :telefono, :limit => 10
      t.string :correo, :limit => 40
      t.string :observaciones, :limit => 100
      t.timestamps
    end

    add_index :reservacions, :folio, :name => "folio"
    add_index :reservacions, [:folio, :anio], :name => "anio_folio"

  end

  def self.down
    drop_table :reservacions
  end
end
