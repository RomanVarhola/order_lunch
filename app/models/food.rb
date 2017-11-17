class Food < ApplicationRecord
  has_many :item_menus, as: :item
  has_many :item_orders, as: :item

  validates :title, presence: true, uniqueness: true
  validates :ftype, presence: true
  validates :price, presence: true

  enum ftype: [:cold_food, :hot_food]

  def type_to_s(type)
    case type.to_sym
    when :cold_food then 'Cold food'
    when :hot_food then 'Hot food'
    else ""
    end
  end
end
