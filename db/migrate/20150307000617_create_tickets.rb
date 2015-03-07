class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :event, null: false
      t.date :date, null: false
      t.integer :quantity, null: false
      t.string :section, null: false
      t.string :row, null: false
      t.string :venue, null: false
      t.string :location, null: false

      t.timestamps null: false
    end
  end
end
