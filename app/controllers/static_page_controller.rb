class StaticPageController < ApplicationController
  def home
    @menu = Menu.all
    @cart = Order.where(status: "in_cart", user_id: current_user)
    @preparing = Order.where(status: "preparing", user_id: current_user)
    @shipping = Order.where(status: "shipping", user_id: current_user)
    @complete = Order.where(status: "complete", user_id: current_user)
  end

end
