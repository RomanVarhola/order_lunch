module Api
  module V1
    class OrdersController < ApplicationController
      def index
        @orders = Order.today_order
        render jsonapi: @orders, include: [:user, :food, :drink], status: :ok
      end
    end
  end
end
