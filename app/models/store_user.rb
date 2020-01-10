class StoreUser < ApplicationRecord
  # Relations
  belongs_to :store
  belongs_to :user
end
