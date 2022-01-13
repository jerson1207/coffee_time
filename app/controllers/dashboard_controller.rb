class DashboardController < ApplicationController
  def index
    @incart = Order.where(status: "in_cart")
    @preparing = Order.where(status: "preparing")
    @shipping = Order.where(status: "shipping")
    @complete = Order.where(status: "complete")
  end
  

end
