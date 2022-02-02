class ContactUsController < ApplicationController
  def index
    @contact_u = ContactU.new
  end

  def create
    @contact_u = ContactU.new(contact_u_params)
    if @contact_u.save
        redirect_to contact_us_path
    end
  end

  private
    def contact_u_params
      params.require(:contact_u).permit(:name, :email, :message)
    end
end
