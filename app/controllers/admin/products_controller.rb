class Admin::ProductsController < ApplicationController
  def index
  end

  def show
  end

  def edit
  end

  def new
    @product = Product.new
  end

  def search
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      flash[:notice] = "投稿成功"
      redirect_to admin_product_path(@product)
    else
      flash[:notice] = "投稿失敗"
      render :new
    end
  end

  def update
  end

  def destroy
  end

  private

    def product_params
        params.require(:product).permit(
          :name,:price,:jacket,:stock,:product_status,:label_id,:genre_id,
          artist_attributes: [:id,:name],
          label_attributes: [:id,:name],
          genre_attributes: [:id,:name]
        )
    end
end
