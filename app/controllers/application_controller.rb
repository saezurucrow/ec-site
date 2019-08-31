class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_cart
  before_action :product_search
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :current_admin
  helper_method :signed_in?

  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    products_path
  end

  def current_admin
    remember_token = Admin.encrypt(cookies[:remember_token])
    @admin_current_user ||= Admin.find_by(remember_token: remember_token)
  end

  def admin_sign_in(admin)
    remember_token = Admin.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    admin.update!(remember_token: Admin.encrypt(remember_token))
    @admin_current_user = admin
  end

  def admin_sign_out
    @admin_current_user = nil
    Admin.find(1).remember_token = nil
    Admin.update(remember_token: nil)
  end

  def signed_in?
    Admin.find(1).remember_token.present?
  end

  def current_cart
    if session[:cart_id]
      @cart = Cart.find(session[:cart_id])
    else
      @cart = Cart.new
      @cart.customer_id = current_customer.id
      @cart.save
      session[:cart_id] = @cart.id
      @cart
    end
  end

  private

    def require_sign_in!
      redirect_to admin_login_path unless signed_in?
    end

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name,:last_name_kana,:first_name,:first_name_kana,:image,:postal_code,:address,:tel])
      devise_parameter_sanitizer.permit(:account_update, keys: [:last_name,:last_name_kana,:first_name,:first_name_kana,:image,:postal_code,:address,:tel])
      devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
    end

    def product_search
      @q = Product.ransack(params[:q])
      @products = @q.result(distinct: true).page(params[:page]).per(8)
    end

end
