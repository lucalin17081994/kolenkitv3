class Cart < ApplicationRecord
  has_many :product_sauces

  has_one :bestelling
  belongs_to :user, optional: true
  
  def price
    total_price=0
    product_sauces.each do |p|
      total_price+=p.price
    end
    return total_price
  end

end
