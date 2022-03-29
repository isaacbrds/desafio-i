class CreateMaterials < ActiveRecord::Migration[6.1]
  def change
    create_table :materials do |t|
      t.string :title
      t.integer :quantity

      t.timestamps
    end
  end
end
