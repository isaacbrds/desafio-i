class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items
  has_many :materials, through: :order_items

  accepts_nested_attributes_for :order_items, allow_destroy: true

  paginates_per 5
end
