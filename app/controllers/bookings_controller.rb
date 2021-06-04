# frozen_string_literal: true

class BookingsController < ApplicationController
  before_action :beautify_params, only: :create

  def create
    binding.pry
  end

  def show
  end

  private

  def booking_params
    params.permit(:starts_at, :ends_at, :activities_ids, :rooms_ids)
  end

  def beautify_params
    params[:activities_ids] = params[:activities_ids].split(',')
    params[:rooms_ids] = params[:rooms_ids].split(',')
  end
end
