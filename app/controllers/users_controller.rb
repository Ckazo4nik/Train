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
    @user = User.find_or_create_by(user_params)
    session[:user_id] = @user.id if @user
    respond_with(@user)
  end

  def update
    @user.update(user_params)
    respond_with(@user)
  end

  def destroy
    respond_with(@user.destroy)
  end

  def logout
    session[:user_id] = nil
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end

  def find_user
    @user = User.find(params[:id])
  end
end