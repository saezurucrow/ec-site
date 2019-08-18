class ProductsController < ApplicationController
  def index
    @q = Product.ransack(params[:q])
    @products = @q.result(distinct: true).page(params[:page]).per(8)
  end

  def show
    @product = Product.find(params[:id])
    @discs = @product.discs
  end

  def search
  end
end