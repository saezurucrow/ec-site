class Admin::ProductsController < ApplicationController
  def index
    @product = Product.all
  end

  def show
    @product = Product.find(params[:id])
    @discs = @product.discs
  end

  def edit
    @product = Product.find(params[:id])
    @artist = Artist.all
    @label = Label.all
    @genre = Genre.all
    @disc = @product.discs.build
    @song = @disc.songs.build
  end

  def new
    @product = Product.new
    @artist = Artist.all
    @label = Label.all
    @genre = Genre.all
    @disc = @product.discs.build
    @song = @disc.songs.build
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
    @product = Product.find(params[:id])
    if @product.update(product_params)
      flash[:notice] = "編集成功"
      redirect_to admin_product_path(@product)
    else
      flash[:notice] = "編集失敗"
      render :edit
    end

  end

  def destroy
  end

  private

    def product_params
        params.require(:product).permit(
          :name,:price,:jacket,:stock,:product_status,:artist_id,:label_id,:genre_id,
            discs_attributes: [:id, :disc_number,:_destroy,
              songs_attributes: [:id, :name,:artist_id, :_destroy]]
        )
    end
end
