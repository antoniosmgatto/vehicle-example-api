# frozen_string_literal: true

class VehiclesController < ApplicationController
  before_action :set_vehicle, only: [:update, :show, :destroy]

  def index
    render json: Vehicle.all
  end

  def create
    @vehicle = Vehicle.create(vehicle_params)
    if @vehicle.save
      render json: @vehicle, status: :created
    else
      render json: @vehicle.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: @vehicle
  end

  def update
    if @vehicle.update(vehicle_params)
      render json: @vehicle, status: :ok
    else
      render json: @vehicle.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @vehicle.destroy!

    head :no_content
  end

  private

  def set_vehicle
    @vehicle = Vehicle.find(params[:id])
  end

  def vehicle_params
    params.permit(:license_plate, :model, :make, :color, :category, :vin)
  end
end
