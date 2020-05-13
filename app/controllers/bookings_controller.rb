class BookingsController < ApplicationController
  before_action :set_item, only: [:new, :create]

  def new
    @booking = Booking.new

    @bookings = Booking.where(item_id: @item.id)
    @bookings_dates = @bookings.map do |booking|
      {
        from: booking.start_date,
        to: booking.end_date
      }
    end
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.item = @item
    if @booking.save
      redirect_to items_path
      flash[:notice] = "La réservation a bien été prise en compte"
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :user)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
