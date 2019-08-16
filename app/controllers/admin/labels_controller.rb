class Admin::LabelsController < ApplicationController
  def new
    @label = Label.new
  end

  def create
    @label = Label.new(label_params)

    if @label.save
      flash[:notice] = "投稿成功"
      redirect_to admin_products_path
    else
      flash[:notice] = "投稿失敗"
      p @label.errors.full_messages
      render :new
    end
  end

  private

    def label_params
        params.require(:label).permit(:name)
    end
end
