class AddressesController < ApplicationController
  before_action :authenticate_customer!
  def new
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save
      flash[:notice] = "登録が完了しました。"
      redirect_to customer_path(current_customer)
    else
      flash[:notice] = "登録が失敗しました。"
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destory
  end

  private
    def address_params
      params.require(:address).permit(:name,:address_name,:tel,:postal_code,:customer_id)
    end
end
