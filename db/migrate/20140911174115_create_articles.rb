class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :name
      t.decimal :price_cost, :precision => 8, :scale => 2
      t.decimal :percentaje, :precision => 8, :scale => 2
      t.decimal :price_total, :precision => 8, :scale => 2
      t.decimal :quantity, :precision => 8, :scale => 2
      t.string :barcode
      t.integer :supplier_id

      t.timestamps
    end
    add_index :articles, :id
  end
end
