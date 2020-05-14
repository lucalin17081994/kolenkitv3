class CreateBestellings < ActiveRecord::Migration[6.0]
  def change
    create_table :bestellings do |t|
      t.belongs_to :cart, null: false, foreign_key: true
      t.string :address
      t.string :number

      t.timestamps
    end
  end
end
