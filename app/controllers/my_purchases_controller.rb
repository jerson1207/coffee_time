class MyPurchasesController < ApplicationController
  before_action :require_user

  def require_user
    unless current_user.user?
      redirect_to root_path
    end
  end
  
  def index
    @cart = Order.where(status: "in_cart", user_id: current_user.id )
    @preparing = Order.where(status: "preparing", user_id: current_user.id)
    @shipping = Order.where(status: "shipping", user_id: current_user.id)
    @complete = Order.where(status: "complete", user_id: current_user.id)
  end
end
