module Api
  module V1
    class OrdersController < ApplicationController
      def index
        @orders = Order.where(date: DateTime.now.to_date)
        render jsonapi: @orders, include: [:user, :food, :drink], status: :ok
      end
    end
  end
end
