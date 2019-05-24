class ApplicationController < ActionController::Base

	def after_sign_in_path_for(resource)
    root_path # ログイン後に遷移するpathを設定
  end

  def after_sign_out_path_for(resource)
    root_path # ログアウト後に遷移するpathを設定
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :name_kana, :postal_code, :address, :tel])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name, :name_kana, :postal_code, :address, :tel])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :name_kana, :postal_code, :address, :tel])
  end

    helper_method :current_cart

  def current_cart
  	if session[:cart_id]
  		@cart = Cart.find(session[:cart_id])
  	else
  		@cart = Cart.create
  		session[:cart_id] = @cart.id
  	end
  end
end
