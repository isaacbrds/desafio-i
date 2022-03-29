class Material < ApplicationRecord
  has_many :purchase_items
  scope :for_title, ->(title) { where(["title ILIKE ?", "%#{title}%"]) }
  validates :title, presence: true, uniqueness: true
  validates :quantity, numericality: { greater_than_or_equal_to: 0}
end
