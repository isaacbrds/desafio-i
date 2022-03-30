class Material < ApplicationRecord
  has_many :purchase_items, dependent: :restrict_with_exception
  has_many :purchases, through: :purchase_items
  has_many :order_items, dependent: :restrict_with_exception
  has_many :orders, through: :order_items
  
  paginates_per 10
  
  scope :for_title, ->(title) { where(["title LIKE ?", "%#{title}%"]) }
  validates :title, presence: true, uniqueness: true
  validates :quantity, numericality: { greater_than_or_equal_to: 0}
end
