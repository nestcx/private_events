class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def index
		@users = User.all
	end

	def create
		@user = User.new(user_params)
		if @user.save
			flash[:success] = "Signed up!"
			sign_in(@user)
			redirect_to(@user)
		else
			flash[:danger] = "Error"
			render 'new'
		end
	end

	def show
		@user = User.find(params[:id])
	end

	private

	def user_params
		params.require(:user).permit(:name, :email)
	end

end