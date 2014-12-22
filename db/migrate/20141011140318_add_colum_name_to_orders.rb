class AddColumNameToOrders < ActiveRecord::Migration
  def up
    add_column :orders, :name, :string
  end

  def down
    remove_column :orders, :name
  end

end
