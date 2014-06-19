class BookingsController < ApplicationController
  def new
    @from = session[:from]
    @to = session[:to]
    @mover = MoverDetailFinder.new.for_id(params[:id])
  end

  def create
    record = BookingRecord.create(booking_params)

    mover = MoverFinder.new.find_by_id(booking_params[:mover_id])

    MailSender.new.confirmation(
      record.email,
      record.from,
      record.to,
      record.move_date,
      mover.name
    )

    redirect_to confirmation_path
  end

  def confirmation
  end

  private

  def booking_params
    params.require(:booking).permit!
  end
end