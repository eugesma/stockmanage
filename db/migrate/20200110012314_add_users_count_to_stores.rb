class AddUsersCountToStores < ActiveRecord::Migration[5.2]
  def change
    add_column :stores, :users_count, :integer, :default => 0

    Store.reset_column_information
    Store.all.each do |p|
      Store.update_counters p.id, :users_count => p.users.length
    end
  end
end
