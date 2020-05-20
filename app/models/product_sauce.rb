class ProductSauce < ApplicationRecord
  belongs_to :product
  belongs_to :sauce
  has_and_belongs_to_many :carts
  enum flavor: { geen: "geen",vanille: 'vanille', aardbei: 'aardbei' }

  def price
    if quantity
      if quantity>0
        (product.price+sauce.price) *quantity
      
      else
        (product.price+sauce.price)
      end
    end
  end
  def to_s
    if flavor=="geen"
      if sauce.name!="geen"
        product.name+ " + "+sauce.name
      else
        product.name
      end
    else
      product.name+ " + "+flavor
    end
    
  end
  def name
    if sauce.name!="geen"
      product.name+ " "+sauce.name
    else
      product.name
    end
  end

  
end
