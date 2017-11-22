class Food < ApplicationRecord
  has_many :item_menus, as: :item
  has_many :item_orders, as: :item

  validates :title, presence: true, uniqueness: true
  validates :ftype, presence: true
  validates :price, presence: true

  enum ftype: [:first_course, :main_course]

  def type_to_s(type)
    case type.to_sym
    when :first_course then 'First course'
    when :main_course then 'Main course'
    else ""
    end
  end
end
