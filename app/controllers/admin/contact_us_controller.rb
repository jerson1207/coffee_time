class Admin::ContactUsController < ApplicationController
  
  def index
    @data = ContactU.all
  end
  
end