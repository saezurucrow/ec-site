class UsersController < ApplicationController
	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
	end

	def edit
		@user = User.find_by(params[:id])
		if current_user == @user
		else
			redirect_to users_path
		end
	end

	def update
		@user = User.new(user_params)
		if @user.update(user_params) #Unpermitted parameter: :image←多分アソシエーションが問題
			redirect_to users_path
		else
		end
	end

	private

	def user_params
		params.require(:user).permit(:name,:name_kana,:image_id,:address,:postal_code,:tel,:email)
	end
end
