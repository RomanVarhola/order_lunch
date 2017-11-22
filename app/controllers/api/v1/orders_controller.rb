module Api
  module V1
    class OrdersController < ApplicationController
      def index
        @orders = Order.today_order
        @total_price = CalculateTotalPriceForOrders.new(@orders).call
        render jsonapi: @orders, include: [:user, :food, :drink], status: :ok,
              meta: @total_price
      end
    end
  end
end
