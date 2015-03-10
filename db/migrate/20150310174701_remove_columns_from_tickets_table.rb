class RemoveColumnsFromTicketsTable < ActiveRecord::Migration
  def change
    remove_column :tickets, :section, :string
    remove_column :tickets, :row,  :string
    remove_column :tickets, :venue, :string
    remove_column :tickets, :notes, :string
    add_column :tickets, :description, :string
    change_column_null :tickets, :description, false
  end
end
