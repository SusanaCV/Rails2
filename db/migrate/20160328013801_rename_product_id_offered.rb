class RenameProductIdOffered < ActiveRecord::Migration
  def change
  	rename_column :transactions, :product_id_id, :product_id_offered
  end
end
