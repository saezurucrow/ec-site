class Admin::OrdersController < ApplicationController
  def index
    if signed_in?
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

  def update
    if signed_in?
    else
      redirect_to admin_login_path
    end
  end
end
