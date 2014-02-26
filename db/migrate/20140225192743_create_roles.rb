class CreateRoles < ActiveRecord::Migration
  def self.up
    create_table "roles" do |t|
      t.string :name
    end
    
    # generate the join table
    create_table "roles_users", :id => false do |t|
      t.integer "role_id", "user_id"
    end
    add_index "roles_users", "role_id"
    add_index "roles_users", "user_id"

    #### creamos roles por defecto ####
    Role.create(:name => "admin")
    Role.create(:name => "operador")


  end

  def self.down
    drop_table "roles"
    drop_table "roles_users"
  end
end