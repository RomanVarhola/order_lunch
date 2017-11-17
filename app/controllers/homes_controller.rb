class HomesController < ApplicationController
  before_action :authenticate_user!

  def index
    @menu = Menu.find_by(date: DateTime.now.to_date)
    @order = Order.new
  end
end
