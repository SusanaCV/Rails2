class RenameProductIdReq < ActiveRecord::Migration
  def change
  	rename_column :transactions, :product_id, :product_id_req
  end
end
