class AddNotesColumnToTicketsTable < ActiveRecord::Migration
  def change
    add_column :tickets, :notes, :string
    change_column_null :tickets, :notes, false
  end
end
