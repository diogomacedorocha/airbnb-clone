class BookingsController < ApplicationController
  before_action :authenticate_user!

  def index
    @bookings = current_user.bookings
    .order(Arel.sql("CASE status WHEN 'pending' THEN 0 WHEN 'accepted' THEN 1 WHEN 'declined' THEN 2 ELSE 3 END"))
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
      flash.now[:alert] = "Booking failed. Please check the form and try again."
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @booking = Booking.find(params[:id])
    redirect_to root_path unless @booking.user == current_user
  end

  def update
    @booking = Booking.find(params[:id])

    if (@booking.user == current_user || @booking.flat.user == current_user) && @booking.update(booking_params)
      redirect_back fallback_location: bookings_path, notice: "Booking updated!"
    else
      redirect_back fallback_location: bookings_path, alert: "Booking update failed."
    end
  end

  def requests
    @bookings = Booking
      .joins(:flat)
      .where(flats: { user_id: current_user.id })
      .order(Arel.sql("CASE bookings.status WHEN 'pending' THEN 0 WHEN 'accepted' THEN 1 WHEN 'declined' THEN 2 ELSE 3 END"))
  end

  private

  def booking_params
    permitted = [:flat_id, :start_date, :end_date]

    if params[:booking][:status].present?
      booking = Booking.find_by(id: params[:id]) || Booking.new(flat_id: params[:booking][:flat_id])
      if booking.flat && booking.flat.user == current_user
        permitted << :status
      end
    end

    params.require(:booking).permit(permitted)
  end

end
