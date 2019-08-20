class CustomersController < ApplicationController
  before_action :authenticate_customer!
  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
    if @customer == current_customer
    else
      flash[:notice] = "ダメです。"
    end
  end

  def destroy
  end

  def update
  end
end
