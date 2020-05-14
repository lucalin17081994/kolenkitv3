class Product < ApplicationRecord
  has_many :product_sauces
  has_many :sauces, :through => :product_sauces

  def to_s
    name
  end
end
