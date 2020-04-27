class BookingsController < ApplicationController
  before_action :set_item, only: [:index, :new, :create]
  before_action :set_booking, only: [:edit, :update, :destroy]

  def index
    @bookings = Booking.where(item_id: @item.id)
  end

  def show
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.item = @item
    if @booking.save
      redirect_to item_bookings_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @booking.update(booking_params)
    @item = @booking.item
    redirect_to item_bookings_path(@item)
  end

  def destroy
    @booking.destroy
    @item = @booking.item
    redirect_to item_bookings_path(@item)
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :user)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
