class Bestelling < ApplicationRecord

  validates :address, presence: true
  validates :number, presence: true
  validates :cart, presence:true
  validates :time, presence:true
  belongs_to :user, optional: true
  belongs_to :cart
  
  def total_price
    if isBezorgd && cart.price<37.0
      price=cart.price+2.0
    else
      price=cart.price
    end
  end
  def bestelling
    return cart.product_sauces
  end
end
