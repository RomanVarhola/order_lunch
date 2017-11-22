class CalculateTotalPrice
  attr_reader :order

  def initialize(order)
    @order = order
  end

  def call
    food = order.food
    drink = order.drink
    price = food.price + drink.price
    price
  end
end