class Order < ApplicationRecord
  has_many :item_orders, dependent: :destroy
  has_many :foods, through: :item_orders, source: :item, source_type: 'Food'
  has_many :drinks, through: :item_orders, source: :item, source_type: 'Drink'

  belongs_to :user

  validates :date, presence: true, uniqueness: true

  def add_food(foods)
    self.foods = foods
  end

  def add_drink(drinks)
    self.drinks = drinks
  end
end
