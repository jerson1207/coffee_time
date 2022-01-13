class MenusController < ApplicationController
  before_action :set_menu, only:[:destroy, :show, :edit, :update]


  def index
    if current_user.admin?
      @menus = Menu.all
    else
      redirect_to root_path
    end
  end

  def show
  end

  def new
    if current_user.admin?
      @menu = Menu.new
    else
      redirect_to root_path
    end
  end

  def create
    @menu = Menu.new(menu_params)
    if @menu.save
      redirect_to menus_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @menu.update(menu_params)
      redirect_to menus_path
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
      if current_user.admin?
        @menu = Menu.find(params[:id])
      else
        redirect_to root_path
      end
    end
end
