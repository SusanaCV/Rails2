class RemoveproductOfferedIdFromtransactions < ActiveRecord::Migration
  def change
  	remove_column :transactions, :product_offered_id, :integer
  end
end
