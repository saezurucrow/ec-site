class OrdersController < ApplicationController
  before_action :authenticate_customer!
  #購入方法選択
  def select
    @order = Order.new
  end

  #注文確認
  def confirm
  end

  #注文完了
  def complete
  end

  private

  def order_params
    params.require(:order).permit(:peyment)
  end
end
