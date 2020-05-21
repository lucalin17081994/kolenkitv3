class AddTimeAndNotesToBestellings < ActiveRecord::Migration[6.0]
  def change
    add_column :bestellings, :time, :Time
    add_column :bestellings, :note, :string
  end
end
