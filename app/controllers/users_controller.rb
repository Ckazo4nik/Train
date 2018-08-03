class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :destroy, :update]

  def index
    @users = User.all
    respond_with(@users)
  end

  def new
    respond_with(@user = User.new)
  end

  def show
    respond_with(@user)
  end

  def edit
    respond_with(@user)
  end

  def create
    respond_with(@user = User.create(user_params))
  end

  def update
    @user.update(user_params)
    respond_with(@user)
  end

  def destroy
    respond_with(@user.destroy)
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end

  def find_user
    @user = User.find(params[:id])
  end
end