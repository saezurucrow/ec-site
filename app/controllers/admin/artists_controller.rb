# frozen_string_literal: true

class Admin::ArtistsController < ApplicationController
  before_action :require_sign_in!
  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(artist_params)

    if @artist.save
      flash[:notice] = '投稿成功'
      redirect_to admin_products_path
    else
      flash[:notice] = '投稿失敗'
      p @artist.errors.full_messages
      render :new
    end
  end

  private

  def artist_params
    params.require(:artist).permit(:name)
  end
end
