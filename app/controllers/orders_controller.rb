class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  def index
    @orders = Order.all
  end

  def show
  end

  def new
    @order = Order.new
  end

  def edit
  end

  def create
    @order = current_user.orders.build(order_params)
    
    respond_to do |format|
      if @order.save
        add_food_or_drink_to_order
        add_total_price_to_order
        format.html { redirect_to root_path, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { redirect_to request.referer }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @order.update(order_params)
        add_food_or_drink_to_order
        add_total_price_to_order
        format.html { redirect_to root_path, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    
    def set_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.require(:order).permit(:date, :total_price)
    end

    def add_food_or_drink_to_order
      @food = Food.find_by(id: params[:food_ids])
      @drink = Drink.find_by(id: params[:drink_ids])
      @order.add_food(@food) if @food.present?
      @order.add_drink(@drink) if @drink.present?
    end

    def add_total_price_to_order
      @order.total_price = CalculateTotalPrice.new(@order).call
      @order.save
    end
end
