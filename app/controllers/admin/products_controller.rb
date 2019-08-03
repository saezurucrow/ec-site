class Admin::ProductsController < ApplicationController
  def index
  end

  def show
  end

  def edit
  end

  def new
    @product = Product.new
    @artist = Artist.new
    @label = Label.new
    @genre = Genre.new
  end

  def search
  end

  def create #絶対もっと簡略化できる
    @product = Product.new(product_params)

    @artist = Artist.new(artist_params)
    @label = Label.new(label_params)
    @genre = Genre.new(genre_params)

    if @artist.save && @label.save && @genre.save
      @product.artist_id = @artist.id
      @product.label_id = @label.id
      @product.genre_id = @genre.id

      if @product.save
        redirect_to admin_product_path(@product)
      else
        flash[:notice] = "投稿失敗"
        p @product.errors.full_messages
        render :new
      end

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
          :name,:price,:jacket,:stock,:product_status,
          artist_attributes: [:id, :name],
          artist_attributes: [:id, :name],
          artist_attributes: [:id, :name]
        )
    end

    def artist_params
        params.require(:artist).permit(:name)
    end

    def label_params
        params.require(:label).permit(:name)
    end

    def genre_params
        params.require(:genre).permit(:name)
    end
end
