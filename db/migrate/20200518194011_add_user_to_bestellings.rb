class AddUserToBestellings < ActiveRecord::Migration[6.0]
  def change
    add_column :bestellings, :user_id, :integer
  end
end
