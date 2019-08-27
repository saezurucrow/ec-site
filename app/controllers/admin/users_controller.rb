class Admin::UsersController < ApplicationController
  def index
    if signed_in?
      @users = Customer.all
    else
      redirect_to admin_login_path
    end
  end

  def show
    if signed_in?
    else
      redirect_to admin_login_path
    end
  end

  def edit
    if signed_in?
    else
      redirect_to admin_login_path
    end
  end

  def destroy
    if signed_in?
    else
      redirect_to admin_login_path
    end
  end

  def update
    if signed_in?
    else
      redirect_to admin_login_path
    end
  end

  private

  def admin_params
    params.require(:admin).permit(:name, :mail, :password, :password_confirmation)
  end

end
