class AddColumnCategoryIdToStock < ActiveRecord::Migration
  def up

    add_column :stocks, :category_id, :integer

  end

  def down

    remove_column :stocks, :category_id

  end
end
