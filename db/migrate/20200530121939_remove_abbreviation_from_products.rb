class RemoveAbbreviationFromProducts < ActiveRecord::Migration[6.0]
  def change
    remove_column :products, :abbreviation, :string
  end
end
