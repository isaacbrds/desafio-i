class CreatePurchaseItems < ActiveRecord::Migration[6.1]
  def change
    create_table :purchase_items do |t|
      t.references :material, null: false, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
