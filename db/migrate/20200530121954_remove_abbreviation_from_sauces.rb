class RemoveAbbreviationFromSauces < ActiveRecord::Migration[6.0]
  def change
    remove_column :sauces, :abbreviation, :string
  end
end
