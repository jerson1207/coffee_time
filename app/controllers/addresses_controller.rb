class AddressesController < ApplicationController
  before_action :set_address, only: %i[ edit update destroy ]

  def new
    @address = Address.new
  end

  def edit
  end

  def create
    @address = Address.new(address_params)
    if @address.save
      redirect_to profile_path(current_user.id)
    end
  end

  def update
    
    if @address.update(address_params)
      redirect_to profile_path(current_user.id)
    end
  end

  def destroy
    @address.destroy
    redirect_to addresses_path
  end

  private
    def set_address
      @address = Address.find(params[:id])
    end

    def address_params
      params.require(:address).permit(:street1, :street2, :city, :province, :zip, :user_id)
    end
end
