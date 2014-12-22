class CreateCurrentAccounts < ActiveRecord::Migration
  def change
    create_table :current_accounts do |t|
      t.integer :customer_id
      t.string :detail
      t.decimal :debit, :precision => 8, :scale => 2
      t.decimal :credit,:precision => 8, :scale => 2

      t.timestamps
    end
  end
end
