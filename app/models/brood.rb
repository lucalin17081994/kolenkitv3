class Brood < ApplicationRecord

  has_many :product_sauces

  def to_s
    name + " (€"+ '%.2f' % price.to_s+")"
  end
  
end
