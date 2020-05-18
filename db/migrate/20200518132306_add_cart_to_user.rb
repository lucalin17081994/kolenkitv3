class AddCartToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :cart_id, :integer
  end
end
