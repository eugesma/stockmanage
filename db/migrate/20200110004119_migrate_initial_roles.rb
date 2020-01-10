class MigrateInitialRoles < ActiveRecord::Migration[5.2]
  def change
    Role.create(name: "admin")
    Role.create(name: "newuser")
  end
end
