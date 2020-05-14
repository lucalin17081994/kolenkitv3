class RemoveColumnFromProductSauce < ActiveRecord::Migration[6.0]
  def change
    remove_column :product_sauces, :quantity, :integer
  end
end
