class ReservationsController < ApplicationController
  before_action :ensure_logged_in, only: [:create, :destroy]
  before_action :load_restaurant




  def show

  end


  def create
    @reservation = @restaurant.reservations.build(reservation_params)
    @reservation.user = current_user

    if @reservation.save
      redirect_to restaurants_path, notice: "Your reservation has been created!"
    else
      render restaurants_path
    end
  end


  def edit
    @reservation = Reservation.find(params[:id])
  end


  def update
    @reservation = Reservation.find(params[:id])

    if @reservation.update_attributes(reservation_params)
      redirect_to restaurants_path, notice: "Your reservation has been updated successfully!"
    else
      render :edit
    end
  end


  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to restaurants_path, notice: "You have deleted your reservation!"
  end


  private

  def reservation_params
    params.require(:reservation).permit(:party_size, :time)
  end


  def load_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end


end
