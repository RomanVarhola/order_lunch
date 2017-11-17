class Order < ApplicationRecord
  has_one :order_food, dependent: :destroy
  has_one :order_drink, dependent: :destroy
  has_one :food, through: :order_food
  has_one :drink, through: :order_drink

  belongs_to :user

  scope :today_order, -> { where(date: DateTime.now.to_date) }

  validates :date, presence: true, uniqueness: true

  def add_food(food)
    self.food = food
  end

  def add_drink(drink)
    self.drink = drink
  end
end
