class Admin::GenresController < ApplicationController
  def new
    if signed_in?
      @genre = Genre.new
    else
      redirect_to admin_login_path
    end
  end

  def create
    if signed_in?
      @genre = Genre.new(genre_params)

      if @genre.save
        flash[:notice] = "投稿成功"
        redirect_to admin_products_path
      else
        flash[:notice] = "投稿失敗"
        p @genre.errors.full_messages
        render :new
      end
    else
      redirect_to admin_login_path
    end
  end

  private

    def genre_params
        params.require(:genre).permit(:name)
    end
end

