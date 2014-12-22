class AddColumnDiscountToInvoices < ActiveRecord::Migration
  def up
    add_column :orders, :discount, :decimal, :precision => 8 , :scale => 2
  end

  def down
    remove_column :orders, :discount
  end
end
