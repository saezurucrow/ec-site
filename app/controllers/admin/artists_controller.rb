class Admin::ArtistsController < ApplicationController
  def new
    @ artist = Artist.new
  end

  def create
  end

  private

    def artist_params
        params.require(:artist).permit(:name)
    end
end
