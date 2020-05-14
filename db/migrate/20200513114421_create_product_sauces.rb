class CreateProductSauces < ActiveRecord::Migration[6.0]
  def change
    create_table :product_sauces do |t|
      t.belongs_to :product, null: false, foreign_key: true
      t.belongs_to :sauce, null: false, foreign_key: true

      t.timestamps
    end
  end
end
