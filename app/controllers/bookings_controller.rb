class BookingsController < ApplicationController
  def create
    BookingRecord.create(booking_params)

    redirect_to confirmation_path
  end

  def confirmation
  end

  private

  def booking_params
    params.require(:booking).permit!
  end
end