class ProductsController < ApplicationController
  def index
  	@products = Product.all
  end

  def new
  	@product = Product.new
  end

  def edit
  	@product  = Product.find_by(params[:id])
  end

  def create
  	@product = Product.new(product_params)
  	if @product.save
  		redirect_to products_path
  	else
  		render "new"
  	end
  end

  def update
    @product = Product.find_by(params[:id])
    if @product.update(product_params)
      redirect_to product_path(@product)
    else
      render 'edit'
    end
  end

  private

  def product_params
  	params.require(:product).permit(:name,:artist,:jacket_id,:price,:label,:genre,:music,:stock)
  end
end
