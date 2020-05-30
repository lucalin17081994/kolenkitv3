class ProductSauce < ApplicationRecord
  belongs_to :product
  belongs_to :sauce
  belongs_to :brood
  has_and_belongs_to_many :carts
  enum flavor: { geen: "geen",vanille: 'vanille', aardbei: 'aardbei' }

  def price
    if quantity
      if quantity>0
        (brood.price+product.price+sauce.price) *quantity
      
      else
        (brood.price+product.price+sauce.price)
      end
    end
  end

  def to_s
    
    (brood.name+" "+product.name+" "+sauce.name+" "+flavor).remove("geen")


  end

 
  
end
