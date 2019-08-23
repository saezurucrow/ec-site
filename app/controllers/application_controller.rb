class ApplicationController < ActionController::Base
  before_action :product_search
  before_action :configure_permitted_parameters, if: :devise_controller?

  def sign_in(user)
    remember_token = User.new_remember_token
    cookies.permanent[:user_remember_token] = remember_token
    user.update!(remember_token: User.encrypt(remember_token))
    @current_user = user
  end

  protected

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
