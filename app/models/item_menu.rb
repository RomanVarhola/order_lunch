class ItemMenu < ApplicationRecord
  belongs_to :item, polymorphic: true
  belongs_to :menu
end
