module MyPurchasesHelper

  def nothing_to_display_cart
    cart = Order.where(status: "in_cart", user_id: current_user.id ).count
    if cart == 0
      return "Nothing to display"
    end
  end

  def nothing_to_display_cart
    cart = Order.where(status: "in_cart", user_id: current_user.id ).count
    if cart == 0
      return "Nothing to display"
    end
  end

  def nothing_to_display_preparing
    preparing = Order.where(status: "preparing", user_id: current_user.id ).count
    if preparing == 0
      return "Nothing to display"
    end
  end

  def nothing_to_display_shipping
    shipping = Order.where(status: "shipping", user_id: current_user.id ).count
    if shipping == 0
      return "Nothing to display"
    end
  end

  def nothing_to_display_complete
    complete = Order.where(status: "complete", user_id: current_user.id ).count
    if complete == 0
      return "Nothing to display"
    end
  end
end
