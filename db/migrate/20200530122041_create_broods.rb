class CreateBroods < ActiveRecord::Migration[6.0]
  def change
    create_table :broods do |t|
      t.string :name
      t.decimal :price

      t.timestamps
    end
  end
end
