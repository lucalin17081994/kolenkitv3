class AddBroodIdToProductSauces < ActiveRecord::Migration[6.0]
  def change
    add_column :product_sauces, :brood_id, :integer
  end
end
