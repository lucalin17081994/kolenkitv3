class AddBroodToProductSauces < ActiveRecord::Migration[6.0]
  def change
    add_column :product_sauces, :brood, :integer
  end
end
