class AddColToCart < ActiveRecord::Migration[6.0]
  def change
    add_column :carts, :bestelling_id, :integer
  end
end
