class AddColumnInvoiceIdToAccoutingRecords < ActiveRecord::Migration
  def change
    add_column :accounting_records, :invoice_id, :integer
  end
end
