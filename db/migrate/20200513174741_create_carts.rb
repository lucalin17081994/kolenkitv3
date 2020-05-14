class CreateCarts < ActiveRecord::Migration[6.0]
  def change
    create_table :carts do |t|
      t.integer :product_sauces_id, array:true, default:[]

      t.timestamps
    end
  end
end
