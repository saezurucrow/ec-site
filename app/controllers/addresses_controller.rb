# frozen_string_literal: true

class AddressesController < ApplicationController
  before_action :authenticate_customer!
  def new
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save
      flash[:notice] = '登録が完了しました。'
      redirect_to customer_path(current_customer)
    else
      flash[:notice] = '登録が失敗しました。'
      render :new
    end
  end

  def edit
    @address = Address.find(params[:id])
    render root_path if current_customer = !@address.customer
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      flash[:notice] = '変更完了しました。'
      redirect_to customer_path(@address.customer)
    else
      flash[:notice] = '変更失敗しました。'
      render :edit
    end
  end

  def destory; end

  private

  def address_params
    params.require(:address).permit(:name, :address_name, :tel, :postal_code, :customer_id)
  end
end
