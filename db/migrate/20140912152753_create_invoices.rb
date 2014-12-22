class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.integer :customer_id
      t.decimal :price_total, :precision=> 8 , :scale => 2

      t.timestamps
    end
  end
end
