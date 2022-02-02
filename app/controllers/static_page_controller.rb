class StaticPageController < ApplicationController

  def home
    @menu = Menu.all
  end

  def about_us
    
  end

end
