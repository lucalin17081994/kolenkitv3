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
  def afkorting
    s=""
    if product.abbreviation!=""
      s+=product.abbreviation
    else
      s+=product.name
    end
    if sauce.abbreviation!=""
      s+="+"+sauce.abbreviation
    else
      if sauce.name!="geen"
        s+="+"+sauce.name
      end
    end
    if flavor!="geen"
      s+="+"+flavor
    end
    
    return s
  end

  def name
    if sauce.name!="geen"
      product.name+ " "+sauce.name
    else
      product.name
    end
  end

  
end
