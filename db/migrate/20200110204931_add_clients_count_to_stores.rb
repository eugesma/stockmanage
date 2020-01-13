class AddClientsCountToStores < ActiveRecord::Migration[5.2]
  def change
    add_column :stores, :clients_count, :integer, :default => 0

    Store.reset_column_information
    Store.all.each do |p|
      Store.update_counters p.id, :clients_count => p.clients.length
    end
  end
end
