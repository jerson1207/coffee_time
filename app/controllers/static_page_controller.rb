class StaticPageController < ApplicationController

  def home
    @menu = Menu.all
  end

end
