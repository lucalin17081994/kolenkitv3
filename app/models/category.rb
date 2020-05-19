class Category < ApplicationRecord
  has_many :products

  def to_s
    return name
  end
end
