class MenusController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_user!, only: [:index]
  before_action :set_menu, only: [:show, :edit, :update, :destroy]

  def index
    @menus = Menu.all
  end

  def show
    @foods = @menu.foods
    @drinks = @menu.drinks
  end

  def new
    @menu = Menu.new
  end

  def edit
  end

  def create
    @menu = Menu.new(menu_params)

    respond_to do |format|
      if @menu.save
        add_food_or_drink_to_menu
        format.html { redirect_to menus_path, notice: 'Menu was successfully created.' }
        format.json { render :show, status: :created, location: @menu }
      else
        format.html { render :new }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @menu.update(menu_params)
        add_food_or_drink_to_menu
        format.html { redirect_to menus_path, notice: 'Menu was successfully updated.' }
        format.json { render :show, status: :ok, location: @menu }
      else
        format.html { render :edit }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @menu.destroy
    respond_to do |format|
      format.html { redirect_to menus_url, notice: 'Menu was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    
    def set_menu
      @menu = Menu.find(params[:id])
    end

    def menu_params
      params.require(:menu).permit(:title, :date, :avatar)
    end

    def add_food_or_drink_to_menu
      @foods = Food.where(id: params[:food_ids])
      @drinks = Drink.where(id: params[:drink_ids])
      @menu.add_food_or_drink(@foods, @drinks)
    end
end
