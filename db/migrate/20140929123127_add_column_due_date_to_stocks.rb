class AddColumnDueDateToStocks < ActiveRecord::Migration

  def up
    add_column :stocks, :due_date, :date
  end

  def down
    remove_column :stocks, :due_date
  end

end
