class CreateClientTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :client_types do |t|
      t.string :name

      t.timestamps
    end

    add_reference :stores, :client_type, foreign_key: true
  end
end
