class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :code
      t.decimal :cost_price
      t.decimal :sale_price
      t.decimal :store_price

      t.timestamps
    end
  end
end
