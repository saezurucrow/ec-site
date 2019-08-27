class Admin::LabelsController < ApplicationController
  def new
    if signed_in?
      @label = Label.new
    else
      redirect_to admin_login_path
    end
  end

  def create
    if signed_in?
      @label = Label.new(label_params)

      if @label.save
        flash[:notice] = "投稿成功"
        redirect_to admin_products_path
      else
        flash[:notice] = "投稿失敗"
        p @label.errors.full_messages
        render :new
      end
    else
      redirect_to admin_login_path
    end
  end

  private

    def label_params
        params.require(:label).permit(:name)
    end
end

