class AddAbbreviationToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :abbreviation, :string
  end
end
