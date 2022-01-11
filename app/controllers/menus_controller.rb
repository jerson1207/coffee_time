class MenusController < ApplicationController
  before_action :set_menu, only:[:destroy, :show, :edit, :update]

  def index
    @menus = Menu.all
  end

  def show
  end

  def new
    @menu = Menu.new
  end

  def create
    @menu = Menu.new(menu_params)
    if @menu.save
      redirect_to @menu
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @menu.update(menu_params)
      redirect_to @menu
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @menu.destroy
    redirect_to menus_path, status: :see_other
  end

  private 
    def menu_params
      params.require(:menu).permit(:title, :description, :price)
    end

    def set_menu
      @menu = Menu.find(params[:id])
    end
end
