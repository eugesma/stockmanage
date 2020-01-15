class Product < ApplicationRecord

  # Validations
  validates_presence_of :name, :code, :cost_price, :sale_price, :store_price
  validates_uniqueness_of :code

end
