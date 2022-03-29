class AddPurchaseReferenceToPurchaseItems < ActiveRecord::Migration[6.1]
  def change
    add_reference :purchase_items, :purchase, null: false, foreign_key: true
  end
end
