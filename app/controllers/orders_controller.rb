class OrdersController < ApplicationController

  def new
    @menu = Menu.find(params[:menu_id])
    @order = @menu.orders.new
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to "/#menu"
    else
      render :new, status: :unprocessable_entity 
    end
  end

  private
    def order_params
      params.require(:order).permit(:quantity, :user_id, :menu_id)
    end
end
