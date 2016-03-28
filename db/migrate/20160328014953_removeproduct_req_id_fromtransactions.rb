class RemoveproductReqIdFromtransactions < ActiveRecord::Migration
  def change
  	remove_column :transactions, :product_req_id, :integer
  end
end
