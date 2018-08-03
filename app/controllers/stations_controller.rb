class StationsController < ApplicationController
  before_action :find_station, only: [:show, :edit, :destroy, :update]

  def index
    @stations = Station.all
    respond_with(@stations)
  end

  def new
    respond_with(@station = Station.new)
  end

  def show
    respond_with(@station)
  end

  def edit
    respond_with(@station)
  end

  def create
    respond_with(@station = Station.create(station_params))
  end

  def update
    @station.update(station_params)
    respond_with(@station)
  end

  def destroy
    respond_with(@station.destroy)
  end

  private

  def station_params
    params.require(:station).permit(:name)
  end

  def find_station
    @station = Station.find(params[:id])
  end
end
