class CreateStoreTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :store_types do |t|
      t.string :name

      t.timestamps
    end
    
    add_reference :stores, :store_type, foreign_key: true
  end
end
