class AddProductIdToTransactionD < ActiveRecord::Migration
  def change
    add_reference :transactions, :product_id, index: true
  end
end
