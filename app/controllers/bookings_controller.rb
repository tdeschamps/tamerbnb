class BookingsController < ApplicationController

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.create(booking_params)
    redirect_to booking_path(@booking)
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private

  def booking_params
    @booking_params = params.require(:booking).permit(:listing_id, :user_id, :begin_date, :end_date, :price)
  end
end
