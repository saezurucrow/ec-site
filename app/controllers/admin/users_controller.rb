class Admin::UsersController < ApplicationController
  before_action :require_sign_in!
  def index
      @users = Customer.all
  end

  def show
  end

  def edit
  end

  def destroy
  end

  def update
  end

  private

  def admin_params
    params.require(:admin).permit(:name, :mail, :password, :password_confirmation)
  end

end
