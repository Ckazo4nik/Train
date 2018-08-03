class TrainsController < ApplicationController
  before_action :find_train, only: [:show, :edit, :destroy, :update]

  def index
    @trains = Train.all
    respond_with(@trains)
  end

  def new
    respond_with(@train = Train.new)
  end

  def show
    respond_with(@train)
  end

  def edit
    respond_with(@train)
  end

  def create
    @train = Train.create(train_params)
    respond_with(@train)
  end

  def update
    @train.update(train_params)
    respond_with(@train)
  end

  def destroy
    respond_with(@train.destroy)
  end

  private

  def train_params
    params.require(:train).permit(:first_name_station, :last_name_station, :place)
  end

  def find_train
    @train = Train.find(params[:id])
  end
end
