class Cart < ApplicationRecord
  has_many :product_sauces

  has_one :bestelling
  
  
  

end
