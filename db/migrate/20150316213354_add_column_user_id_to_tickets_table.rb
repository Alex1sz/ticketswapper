class AddColumnUserIdToTicketsTable < ActiveRecord::Migration
  def change
    add_column :tickets, :user_id, :integer
    change_column_null :tickets, :user_id, false
  end
end
