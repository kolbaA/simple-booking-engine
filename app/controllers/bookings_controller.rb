# frozen_string_literal: true

class BookingsController < ApplicationController

  def create
    booking = Bookings::CreateReservationService.new(
      booking_params,
      user_id: session.id
    ).call

    redirect_to confirmation_booking_path(booking)
  rescue StandardError
    redirect_to booking_error_path
  end

  def confirmation
    @booking = Booking.find(booking_params[:id])
  end

  def booking_error; end

  private

  def booking_params
    params.permit(:starts_at, :ends_at, :activities_ids, :room_id, :location_id, :id)
  end
end
