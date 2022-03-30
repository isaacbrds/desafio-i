class Purchase < ApplicationRecord
  belongs_to :user
  has_many :purchase_items
  has_many :materials, through: :purchase_items

  accepts_nested_attributes_for :purchase_items, allow_destroy: true

  paginates_per 5
end
