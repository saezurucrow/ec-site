class Admin::ProductsController < ApplicationController
  def index
  end

  def show
  end

  def edit
  end

  def new
    @product = Product.new
    @artist = Artist.all
    @label = Label.all
    @genre = Genre.all
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
      p @product.errors.full_messages
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
          :name,:price,:jacket,:stock,:product_status,:artist_id,:label_id,:genre_id
        )
    end
end
