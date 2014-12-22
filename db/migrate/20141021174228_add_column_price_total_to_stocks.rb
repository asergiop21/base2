class AddColumnPriceTotalToStocks < ActiveRecord::Migration
  def self.up
    add_column :stocks, :price_total, :integer
  end
  
  def self.down
    remove_column :stocks, :price_total
  end

end
