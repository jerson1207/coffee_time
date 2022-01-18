
class Admin::UsersController < ApplicationController
  before_action :set_user, only: :show
  before_action :require_admin

  def require_admin
    unless current_user.admin?
      redirect_to root_path
    end
  end
  

  def index
    @users = User.where(role: "user")
    @all_user_count = User.where(role: "user").size
  end

  def show
  end

  private
    def set_user
      if current_user.admin?
        @user = User.find(params[:id])
      end
    end

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end