module MenusHelper

  def total_menu
    return Menu.all.count
  end
end
