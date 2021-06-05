# frozen_string_literal: true

class BookingsController < ApplicationController
  before_action :beautify_params, only: :create

  def create
    binding.pry
    booking = Bookings::CreationService.new(booking_params, user_id: session.id).call
    
  end

  def show
  end

  private

  def booking_params
    params.permit(:starts_at, :ends_at, :activities_ids, :room_id)
  end

  def beautify_params
    params[:activities_ids] = params[:activities_ids].split(',')
    params[:rooms_ids] = params[:rooms_ids].split(',')
  end
end
