class CustomersController < ApplicationController
  before_action :authenticate_customer!
  def show
    @customer = Customer.find(params[:id])
    @addresses = Address.where(customer_id: params[:id])
    @orders = Order.where(customer_id: current_customer.id).reverse_order
  end

  def edit
    @customer = Customer.find(params[:id])
    if @customer == current_customer
    else
      flash[:notice] = "ダメです。"
      redirect_to customer_path(@customer)
    end
  end

  def destroy
  end

  def update
  end
end
