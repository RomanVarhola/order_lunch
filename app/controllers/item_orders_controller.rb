class ItemOrdersController < ApplicationController
  before_action :set_item_order, only: [:show, :edit, :update, :destroy]

  def index
    @item_orders = ItemOrder.all
  end

  def show
  end

  def new
    @item_order = ItemOrder.new
  end

  def edit
  end

  def create
    @item_order = ItemOrder.new(item_order_params)

    respond_to do |format|
      if @item_order.save
        format.html { redirect_to @item_order, notice: 'Item order was successfully created.' }
        format.json { render :show, status: :created, location: @item_order }
      else
        format.html { render :new }
        format.json { render json: @item_order.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @item_order.update(item_order_params)
        format.html { redirect_to @item_order, notice: 'Item order was successfully updated.' }
        format.json { render :show, status: :ok, location: @item_order }
      else
        format.html { render :edit }
        format.json { render json: @item_order.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @item_order.destroy
    respond_to do |format|
      format.html { redirect_to item_orders_url, notice: 'Item order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_item_order
      @item_order = ItemOrder.find(params[:id])
    end

    def item_order_params
      params.fetch(:item_order, {})
    end
end
