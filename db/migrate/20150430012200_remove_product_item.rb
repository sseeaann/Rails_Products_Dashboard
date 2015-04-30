class RemoveProductItem < ActiveRecord::Migration
  def change
  	remove_column :categories, :product_id, :references
  end
end
