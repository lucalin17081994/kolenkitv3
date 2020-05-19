class AddSauceToCategories < ActiveRecord::Migration[6.0]
  def change
    add_column :categories, :hasSauce, :boolean
  end
end
