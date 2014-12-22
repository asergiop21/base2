class AddColumnInvoiceIdToCurrentAcconts < ActiveRecord::Migration
  def change
    add_column :current_accounts, :invoice_id, :integer
  end
end
