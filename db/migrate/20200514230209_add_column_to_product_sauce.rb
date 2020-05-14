class AddColumnToProductSauce < ActiveRecord::Migration[6.0]
  def change
    add_column :product_sauces, :quantity, :integer
  end
end
