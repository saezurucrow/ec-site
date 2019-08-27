class Admin::ProductsController < ApplicationController
  def index
    if signed_in?
      @products = Product.all
    else
      redirect_to admin_login_path
    end
  end

  def show
    if signed_in?
      @product = Product.find(params[:id])
      @discs = @product.discs
    else
      redirect_to admin_login_path
    end
  end

  def edit
    if signed_in?
      @product = Product.find(params[:id])
      @artist = Artist.all
      @label = Label.all
      @genre = Genre.all
      @disc = @product.discs.build
      @song = @disc.songs.build
    else
      redirect_to admin_login_path
    end
  end

  def new
    if signed_in?
      @product = Product.new
      @artist = Artist.all
      @label = Label.all
      @genre = Genre.all
      @disc = @product.discs.build
      @song = @disc.songs.build
    else
      redirect_to admin_login_path
    end
  end

  def search
  end

  def create
    if signed_in?
      @product = Product.new(product_params)

      if @product.save
        flash[:notice] = "投稿成功"
        redirect_to admin_product_path(@product)
      else
        flash[:notice] = "投稿失敗"
        p @product.errors.full_messages
        render :new
      end

    else
      redirect_to admin_login_path
    end

  end

  def update
    if signed_in?
      @product = Product.find(params[:id])
      if @product.update(product_params)
        flash[:notice] = "編集成功"
        redirect_to admin_product_path(@product)
      else
        flash[:notice] = "編集失敗"
        render :edit
      end

    else
      redirect_to admin_login_path
    end

  end

  def destroy
    if signed_in?
      @product = Product.find(params[:id])
      if @product.destroy
        flash[:notice] = "削除成功"
        redirect_to admin_products_path
      else
        flash[:notice] = "削除失敗"
        redirect_to :index
      end

    else
      redirect_to admin_login_path
    end
  end

  private

    def product_params
        params.require(:product).permit(
          :name,:price,:jacket,:stock,:product_status,:artist_id,:label_id,:genre_id,
            discs_attributes: [:id, :disc_number,:_destroy,
              songs_attributes: [:id, :song_number,:name,:artist_id, :_destroy]]
        )
    end
end
