class AddProductIdToTransactionD < ActiveRecord::Migration
  def change
    add_reference :transactions, :product, index: true
  end
end
