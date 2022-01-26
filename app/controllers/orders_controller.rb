class OrdersController < ApplicationController
  def index
    @orders = Order.where(status: "uncart")
  end

  def cancel
    @order = Order.find(params[:id])
    @order.status = "uncart"
    @order.save
    redirect_to root_path
  end

  def preparing
    @order = Order.find(params[:id])
    @order.status = "preparing"
    @order.save
    redirect_to admin_dashboard_path
  end

  def shipping
    @order = Order.find(params[:id])
    @order.status = "shipping"
    @order.save
    redirect_to admin_dashboard_path
  end

  def complete
    @order = Order.find(params[:id])
    @order.status = "complete"
    @order.save
    redirect_to admin_dashboard_path
  end

  def new
    @menu = Menu.find(params[:menu_id])
    @order = @menu.orders.new
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to "/my_purchases"
    else
      render :new, status: :unprocessable_entity 
    end
  end

  private
    def order_params
      params.require(:order).permit(:quantity, :user_id, :menu_id)
    end
end
