class PurchaseItem < ApplicationRecord
  belongs_to :material
  belongs_to :purchase
  before_save :check_inventory
  after_save :create_log
  
  validates :quantity, numericality: { greater_than_or_equal_to: 0}

  def check_inventory
    material = Material.find(material_id)
    material.quantity += quantity 
    material.save!
  end

  def create_log
    file_name = "#{Date.today.strftime("%d-%m-%Y")}-log.txt"
    File.open("log/#{file_name}", 'a') do |f|
      f.write("Entrada feita por #{self.purchase.user.email} em #{created_at.strftime("%d-%m-%Y às %H:%M:%S")} - Material: #{material.title} - Quantidade: #{quantity} \n")
    end
  end
end
