class Admin::UsersController < ApplicationController
  before_action :require_sign_in!

  def index
    @users = Customer.all.reverse_order.page(params[:page]).per(8)
  end

  def show
    @user = Customer.find(params[:id])
    @orders = @user.orders.reverse_order
  end

  def edit
    @user = Customer.find(params[:id])
  end

  def update
    @user = Customer.find(params[:id])
    if @user.update(user_params)
  	  redirect_to admin_user_path(@user)
    else
      render :show
    end
  end

  def destroy
  end

  private

  def admin_params
    params.require(:admin).permit(:name, :mail, :password, :password_confirmation)
  end

  def user_params
    params.require(:customer).permit(:last_name,:last_name_kana,:first_name,:first_name_kana,
                          :image,:email)
  end
end
