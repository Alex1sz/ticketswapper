class AddNullFalsetoEmailColumnTicketsTable < ActiveRecord::Migration
  def change
    change_column_null :tickets, :email, false
  end
end
