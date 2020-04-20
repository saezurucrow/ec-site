# frozen_string_literal: true

class Admin::OrdersController < ApplicationController
  before_action :require_sign_in!
  def index
    @orders = Order.all.reverse_order
  end

  def show
    @order = Order.find(params[:id])
  end

  def edit
    @order = Order.find(params[:id])
    @user = @order.customer
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      flash[:notice] = '編集が完了しました。'
      redirect_to admin_order_path(@order)
    else
      flash[:notice] = '編集に失敗しました。'
      @user = @order.customer
      render :edit
    end
  end

  private

  def order_params
    params.require(:order).permit(:payment, :order_status, :address_id)
  end
end
