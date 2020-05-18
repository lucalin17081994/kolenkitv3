class AddBestellingsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :bestelling_id, :integer
  end
end
