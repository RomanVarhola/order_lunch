class CalculateTotalPrice
  attr_reader :order

  def initialize(order)
    @order = order
  end

  def call
    food = order.food
    drink = order.drink
    if food.present? && drink.present?
      price = food.price + drink.price
    elsif food.present?
      price = food.price
    elsif
      price = drink.price
    end
    price
  end
end