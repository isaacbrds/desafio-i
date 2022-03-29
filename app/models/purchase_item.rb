class PurchaseItem < ApplicationRecord
  belongs_to :material
  belongs_to :purchase
  before_save :check_inventory

  def check_inventory
    material = Material.find(material_id)
    material.quantity += quantity
    material.save! 
  end
end
