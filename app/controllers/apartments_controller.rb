class ApartmentsController < ApplicationController

  def index
    render json: Apartment.all
  end

  def show
    apartment = find_apartment
    render json: apartment, status: :ok
  end

  def create
    apartment = Apartment.create!(apartment_params)
    render json: apartment, status: :created
  end

  def update
    apartment = find_apartment
    apartment.update(apartment_params)
    render json: apartment, status: :ok
  end

  def destroy
    apartment = find_apartment
    apartment.destroy
    head :no_content
  end

  private

  def find_apartment
    apartment = Apartment.find(params[:id])
  end

  def apartment_params
    params.permit(:number)
  end

end
