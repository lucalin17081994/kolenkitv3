class AddAbbreviationToSauzen < ActiveRecord::Migration[6.0]
  def change
    add_column :sauces, :abbreviation, :string
  end
end
