module ApplicationHelper

  def user(id)
    user = User.find(id)
    user.email
  end

  def title(id)
    menu = Menu.find(id)
    menu.title
  end

  def price(id)
    menu = Menu.find(id)
    menu.price
  end

  def status(id)
    menu = Menu.find(id)
    menu.status
  end

  def total(price, quantity)
    menu = Menu.find(price)
    menu.price * quantity
  end
end
