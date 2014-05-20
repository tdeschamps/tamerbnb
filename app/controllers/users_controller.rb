class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.create(@user_params)
    redirect_to user_path(@user)
  end

  def show
  end

  def edit
    @user.update!(@user_params)
    redirect_to user_path(@user)
  end

  def destroy
    @user.destroy
    redirect_to root_path
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def set_params
      @user_params = params.require(:user).permit(:first_name, :last_name,
        :password, :user_name, :bio, :birth_date, :profile_picture, :picture, :email)
    end
end
