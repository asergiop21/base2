class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :article_id
      t.decimal :quantity
      t.decimal :price_unit, :precision=> 8, :scale => 2
      t.decimal :price_total, :precision=>8, :scale => 2
      t.integer :invoice_id

      t.timestamps
    end
    add_index :orders, :id
  end
end
