class ProductSauce < ApplicationRecord
  belongs_to :product
  belongs_to :sauce
  has_many :carts
  
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
    
    if sauce.name!="geen"
      product.name+ " "+sauce.name
    else
      product.name
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
