class StoreUser < ApplicationRecord
  # Relations
  belongs_to :store, :counter_cache => :users_count
  belongs_to :user
end
