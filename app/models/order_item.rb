class OrderItem < ApplicationRecord
  belongs_to :material
  belongs_to :order
  before_save :check_inventory
  after_save :create_log
  validates :quantity, numericality: { greater_than_or_equal_to: 0}
  validate :is_business_hour?, :is_weekend?, :is_enough?

  def check_inventory
    material = Material.find(material_id)
    return if is_business_hour?
    return if is_weekend?
    return if is_enough?
    material.quantity -= quantity
    material.save!
  end

  def is_business_hour?
    errors.add(:created_at, I18n.t("order_item.business_hour")) if Time.now.hour >= 17 || Time.now.hour < 9
  end

  def is_weekend?
    errors.add(:created_at, I18n.t("order_item.weekend")) if Date.today.saturday? || Date.today.sunday?
  end

  def is_enough?
    if quantity?
      errors.add(:quantity, I18n.t("order_item.enough_quantity")) if self.material.quantity < quantity
    end
  end

  def create_log
    file_name = "#{Date.today.strftime("%d-%m-%Y")}-log.txt"
    File.open("log/#{file_name}", 'a') do |f|
      f.write("Saída feita por #{self.order.user.email} em #{created_at.strftime("%d-%m-%Y às %H:%M:%S")} - Material: #{material.title} - Quantidade: #{quantity} \n")
    end
  end
end
