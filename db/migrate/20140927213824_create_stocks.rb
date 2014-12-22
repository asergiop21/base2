class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.references :article
      t.decimal :quantity, :precision => 8, :scale => 2
      t.decimal :price_cost, :precision => 8, :scale => 2
      t.references :supplier
      t.references :invoice_stock
      t.timestamps
    end
  end
end
