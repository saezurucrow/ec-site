class ApplicationController < ActionController::Base
  before_action :product_search

  private

  def product_search
    @q = Product.ransack(params[:q])
    @products = @q.result(distinct: true)
  end
end
