class AddFlavorToProductSauces < ActiveRecord::Migration[6.0]
  def change
    add_column :product_sauces, :flavor, :string
  end
end
