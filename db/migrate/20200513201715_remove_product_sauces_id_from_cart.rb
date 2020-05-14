class RemoveProductSaucesIdFromCart < ActiveRecord::Migration[6.0]
  def change
    remove_column :carts, :product_sauces_id, :integer
  end
end
