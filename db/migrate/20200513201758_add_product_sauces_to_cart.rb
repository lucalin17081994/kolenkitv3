class AddProductSaucesToCart < ActiveRecord::Migration[6.0]
  def change
    add_column :carts, :product_sauces_id, :integer, array:true, default:[]
  end
end
