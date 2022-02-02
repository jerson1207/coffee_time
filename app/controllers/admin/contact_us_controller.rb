class Admin::ContactUsController < ApplicationController
  def index
    @contact_u = ContactU.all
  end
end
