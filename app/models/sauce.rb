class Sauce < ApplicationRecord
  has_many :product_sauces
  has_many :products, :through => :product_sauces

  def to_s
    name
  end
end
