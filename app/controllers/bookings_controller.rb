class BookingsController < ApplicationController
  before_action :authenticate_user!

  def index
    @bookings = current_user.bookings
  end

  def new
    @flat = Flat.find(params[:flat_id] || params[:flat])
    @booking = Booking.new
  end

  def create
    @booking = current_user.bookings.new(booking_params)
    @booking.status = "pending"

    if @booking.save
      redirect_to bookings_path, notice: "Booking request sent!"
    else
      @flat = Flat.find(params[:flat_id] || params[:flat])
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @booking = Booking.find(params[:id])
    redirect_to root_path unless @booking.user == current_user
  end

  def update
    @booking = Booking.find(params[:id])
    if @booking.user == current_user && @booking.update(booking_params)
      redirect_to bookings_path, notice: "Booking updated!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    permitted = [:flat_id, :start_date, :end_date]
    permitted << :status if current_user == @booking&.flat&.user
    params.require(:booking).permit(permitted)
  end

end
