class AddSearchableContentColumnToTicketsTable < ActiveRecord::Migration
  def change
    add_column :tickets, :searchable_content, :text, default: true
  end
end
