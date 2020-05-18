class Cart < ApplicationRecord
  has_and_belongs_to_many :product_sauces
  has_one :bestelling
  
  
  def price
    total_price=0
    product_sauces.each do |p|
      total_price+=p.price
    end
    return total_price
  end

end
