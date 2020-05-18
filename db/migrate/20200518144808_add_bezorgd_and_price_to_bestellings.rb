class AddBezorgdAndPriceToBestellings < ActiveRecord::Migration[6.0]
  def change
    add_column :bestellings, :isBezorgd, :boolean
    add_column :bestellings, :price, :decimal
  end
end
