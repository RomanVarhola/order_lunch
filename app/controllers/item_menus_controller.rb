class ItemMenusController < ApplicationController
  before_action :set_item_menu, only: [:show, :edit, :update, :destroy]

  def index
    @item_menus = Item_menu.all
  end

  def show
  end

  def new
    @item_menu = Item_menu.new
  end

  def edit
  end

  def create
    @item_menu = Day.new(item_menu_params)

    respond_to do |format|
      if @item_menu.save
        format.html { redirect_to @item_menu, notice: 'Day was successfully created.' }
        format.json { render :show, status: :created, location: @item_menu }
      else
        format.html { render :new }
        format.json { render json: @item_menu.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @item_menu.update(item_menu_params)
        format.html { redirect_to @item_menu, notice: 'Day was successfully updated.' }
        format.json { render :show, status: :ok, location: @item_menu }
      else
        format.html { render :edit }
        format.json { render json: @item_menu.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @item_menu.destroy
    respond_to do |format|
      format.html { redirect_to item_menu_url, notice: 'Day was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    
    def set_item_menu
      @item_menu = Item_menu.find(params[:id])
    end

    def item_menu_params
      params.fetch(:item_menu, {})
    end
end
