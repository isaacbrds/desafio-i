class OrderItem < ApplicationRecord
  belongs_to :material
  belongs_to :order
  before_save :check_inventory

  def check_inventory
    material = Material.find(material_id)
    return if is_business_hour?
    return if is_weekend?
    return if is_enough?(quantity)
    material.quantity -= quantity
    material.save!
  end

  def is_business_hour?
    raise Exception.new "This is not business hour" if Time.now.hour > 18 || Time.now.hour < 9
  end

  def is_weekend?
    raise Exception.new "This is not a business day" if Date.today.saturday? || Date.today.sunday?
  end

  def is_enough?(quantity)
    raise Exception.new "Stored quantity is not enough to make this action" if self.material.quantity < quantity
  end
end
