class Admin::GenresController < ApplicationController
  before_action :require_sign_in!
  def new
      @genre = Genre.new
  end

  def create
      @genre = Genre.new(genre_params)

      if @genre.save
        flash[:notice] = "投稿成功"
        redirect_to admin_products_path
      else
        flash[:notice] = "投稿失敗"
        p @genre.errors.full_messages
        render :new
      end
  end

  private

    def genre_params
        params.require(:genre).permit(:name)
    end
end

