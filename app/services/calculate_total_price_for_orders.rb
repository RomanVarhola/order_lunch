class CalculateTotalPriceForOrders
  attr_reader :orders

  def initialize(orders)
    @orders = orders
  end

  def call
    total_price = 0
    @orders.each do |order|
      total_price += order.food.price + order.drink.price
    end
    total_price
  end
end