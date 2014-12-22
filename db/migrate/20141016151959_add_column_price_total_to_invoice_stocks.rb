class AddColumnPriceTotalToInvoiceStocks < ActiveRecord::Migration
  def change
    add_column :invoice_stocks, :price_total, :decimal, :precision => 8, :scale => 2
  end
end
