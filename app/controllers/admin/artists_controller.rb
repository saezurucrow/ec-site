class Admin::ArtistsController < ApplicationController
  
  def new
    if signed_in?
      @artist = Artist.new
    else
      redirect_to admin_login_path
    end
  end

  def create
    if signed_in?
      @artist = Artist.new(artist_params)

      if @artist.save
        flash[:notice] = "投稿成功"
        redirect_to admin_products_path
      else
        flash[:notice] = "投稿失敗"
        p @artist.errors.full_messages
        render :new
      end
    else
      redirect_to admin_login_path
    end
  end

  private

    def artist_params
        params.require(:artist).permit(:name)
    end
end
