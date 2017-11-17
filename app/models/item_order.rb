class ItemOrder < ApplicationRecord
  belongs_to :item, polymorphic: true
  belongs_to :order

  validates :order_id, uniqueness: { scope: [:item_id, :item_type] }
end
