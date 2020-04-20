# frozen_string_literal: true

class Admin::SessionsController < ApplicationController
  before_action :set_admin, only: [:create]
  before_action :require_sign_in!, only: [:create]

  def new; end

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
    if signed_in?
      admin_sign_out
      redirect_to root_path
    else
      redirect_to admin_login_path
    end
  end

  private

  def set_admin
    @admin = Admin.find_by!(mail: session_params[:mail])
  rescue StandardError
    flash[:notice] = 'invalid_mail'
    render action: 'new'
  end

  def require_sign_in!
    admin_login_path unless signed_in?
  end

  # 許可するパラメータ
  def session_params
    params.require(:session).permit(:mail, :password)
  end
end
