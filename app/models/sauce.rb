class Sauce < ApplicationRecord
  has_many :product_sauces
  has_many :products, :through => :product_sauces

  def to_s
    if price==0
      name
    else
      name+"(+€"+price.to_s+")"
    end
  end
end
