class Bestelling < ApplicationRecord

  validates :address, presence: true
  validates :number, presence: true
  validates :cart, presence:true
  belongs_to :user, optional: true
  belongs_to :cart
  enum isBezorgd: {Bezorgen:true, Ophalen:false}
  def total_price
    if isBezorgd
      price=cart.price+2.0
    else
      price=cart.price
    end
  end
end
