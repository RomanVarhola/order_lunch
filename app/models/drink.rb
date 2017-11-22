class Drink < ApplicationRecord
  has_many :item_menus, as: :item
  has_many :item_orders, as: :item

  validates :title, presence: true, uniqueness: true
  validates :dtype, presence: true
  validates :price, presence: true

  enum dtype: [:cold_drink, :hot_drink]

  def type_to_s(type)
    case type.to_sym
    when :cold_drink then 'Cold drink'
    when :hot_drink then 'Hot drink'
    else ""
    end
  end
end
