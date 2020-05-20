class AddDoneFieldToBestellings < ActiveRecord::Migration[6.0]
  def change
    add_column :bestellings, :done, :boolean, default: false
  end
end
