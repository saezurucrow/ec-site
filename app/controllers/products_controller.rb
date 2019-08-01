class ProductsController < ApplicationController
  def index
    @products = Product.all
    @q = Product.ransack(params[:q])
    @products = @q.result(distinct: true)
  end

  def show
  end

  def search
  end
end
