class Bestelling < ApplicationRecord

  validates :address, presence: true
  validates :number, presence: true
  validates :cart, presence:true

  belongs_to :cart, dependent: :destroy
end
