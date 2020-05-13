class ItemsController < ApplicationController

  def index
    @items = Item.all
    @bookings = Booking.all
  end

end
