class ProductSauceCart < ActiveRecord::Migration[6.0]
  def change
    create_join_table :product_sauces, :carts do |t|
      t.index :product_sauce_id
      t.index :cart_id
    end
  end
end
