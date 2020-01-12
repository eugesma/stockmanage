class CreateClients < ActiveRecord::Migration[5.2]
  def change
    create_table :clients do |t|
      t.references :store, foreign_key: true
      t.string :fullname
      t.string :dni
      t.string :cuit
      t.string :phone
      t.string :email

      t.timestamps
    end
  end
end
