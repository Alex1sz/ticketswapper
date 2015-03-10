class AddEmailColumnToTicketsTable < ActiveRecord::Migration
  def change
    add_column :tickets, :email, :string
  end
end
