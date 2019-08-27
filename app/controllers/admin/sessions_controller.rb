class Admin::SessionsController < ApplicationController
  before_action :set_admin, only: [:create]

  def new
  end

  def create
    if @admin.authenticate(session_params[:password])
      admin_sign_in(@admin)
      redirect_to admin_products_path
    else
      flash[:notice] = 'invalid_password'
      render 'new'
    end
  end

  def destroy
    admin_sign_out
    redirect_to root_path
  end

  private

    def set_admin
      @admin = Admin.find_by!(mail: session_params[:mail])
    rescue
      flash[:notice] = 'invalid_mail'
      render action: 'new'
    end

    # 許可するパラメータ
    def session_params
      params.require(:session).permit(:mail, :password)
    end
end
