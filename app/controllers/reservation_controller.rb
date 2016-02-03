class ReservationController < ApplicationController
  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)

    if @reservation.save
      redirect_to restaurants_path, notice: "Your reservation has been created!"
    else
      render :new
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
end
