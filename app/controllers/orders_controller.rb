class OrdersController < ApplicationController
  before_action :authenticate_customer!
  #購入方法選択
  def select
    @cart_items = current_cart.cart_items
    @sum_price = 0
    @order = Order.new
    @customer = current_customer
  end

  #注文確認
  def confirm
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.order_status = 0
    if @order.save
      order_item(@order,current_cart.cart_items)
      flash[:notice] = "お買い上げありがとうございました。"
      redirect_to products_path
    end
  end

  #注文完了
  def complete
  end

  private

  def order_params
    params.require(:order).permit(:payment,:price_sum,:address_id,:customer_id,:order_status)
  end

  def order_item(order, cart_items)
    cart_items.each do |cart_item|
      OrderShow.create(order_id: order.id, product_id: cart_item.id, quantity: cart_item.quantity)
      product = cart_item.product
      product.stock -= cart_item.quantity
      product.save
      cart_item.destroy
    end
  end
end
