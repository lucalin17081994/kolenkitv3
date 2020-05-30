class RemoveBroodFromProductSauces < ActiveRecord::Migration[6.0]
  def change
    remove_column :product_sauces, :brood, :integer
  end
end
