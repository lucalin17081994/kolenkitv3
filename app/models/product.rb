class Product < ApplicationRecord
  has_many :product_sauces
  has_many :sauces, :through => :product_sauces

  validates :name,presence:true
  validates :price,presence:true
  belongs_to :category

  def to_s
    name
  end
end
