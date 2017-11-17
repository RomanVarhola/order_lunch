class Drink < ApplicationRecord
  has_many :item_menus, as: :item
  has_many :item_orders, as: :item

  validates :title, presence: true, uniqueness: true
  validates :dtype, presence: true
  validates :price, presence: true

  enum dtype: [:cold_water, :hot_water]

  def type_to_s(type)
    case type.to_sym
    when :cold_water then 'Cold water'
    when :hot_water then 'Hot water'
    else ""
    end
  end
end
