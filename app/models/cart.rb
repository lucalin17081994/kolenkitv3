class Cart < ApplicationRecord
  has_many :product_sauces, dependent: :destroy

  has_one :bestelling
  
  
  

end
