# frozen_string_literal: true

class CartsController < ApplicationController
  before_action :authenticate_customer!
  before_action :setup_cart_item!, only: %i[add_item update_item delete_item]

  def show
    @cart_items = current_cart.cart_items
    @sum_price = 0
  end

  # 商品一覧画面から、「商品購入」を押した時のアクション
  def add_item
    if @cart_item.blank?
      @cart_item = current_cart.cart_items.build(product_id: params[:cart_item][:product_id])
    end
    # 在庫数が注文数より少ないか
    if Product.find(params[:cart_item][:product_id]).stock >= params[:cart_item][:quantity].to_i
      @cart_item.quantity += params[:cart_item][:quantity].to_i
      @cart_item.save
      flash[:notice] = 'カートに追加しました。'
      redirect_to current_cart
    else
      flash[:notice] = '在庫がありません。'
      redirect_to product_path(params[:cart_item][:product_id])
    end
  end

  # カート詳細画面から、「更新」を押した時のアクション
  def update_item
    @cart_item.update(quantity: params[:quantity].to_i)
    redirect_to current_cart
  end

  # カート詳細画面から、「削除」を押した時のアクション
  def delete_item
    @cart_item.destroy
    redirect_to current_cart
  end

  private

  def setup_cart_item!
    if params[:product_id]
      @cart_item = current_cart.cart_items.find_by(product_id: params[:product_id].to_i)
    else
      @cart_item = current_cart.cart_items.find_by(product_id: params[:cart_item][:product_id])
    end
  end
end
