class EnergyChartsController < ApplicationController
  before_action :authenticate_user!
  def by_day
    @device = params[:device]
    # correct the message delay problem, example message arrived 10:00:05 refers to 09:45 to 10:00, without this fix this message will be include in 10hrs period
    @energy_by_day = Measure.where('created_at BETWEEN ? AND ? AND device_id = ?', DateTime.now.beginning_of_day+30.second, DateTime.now.end_of_day+30.second, @device).group_by_hour_of_day(:created_at, day_start: 0.01).sum(:energy)
    # @energy_by_day = Measure.where('created_at BETWEEN ? AND ? AND device_id = ?', DateTime.now.beginning_of_day+30.second, DateTime.now.end_of_day+30.second, @device).group(:id).group_by_minute(:created_at, format: "%H:%M").maximum(:current)
    # @energy_by_day = Measure.where('created_at BETWEEN ? AND ? AND device_id = ?', DateTime.now.beginning_of_day+30.second, DateTime.now.end_of_day+30.second, @device).group_by_hour_of_day(:created_at, day_start: 0.01).sum(:energy)
    render json: @energy_by_day
    # filter by device
    # Measure.where(device: "1")
  end
  # keep @energy_by_day to simplify @energy_by_week ?
  def by_week
    @device = params[:device]
    @energy_by_week = Measure.where('created_at BETWEEN ? AND ? AND device_id = ?', DateTime.now.beginning_of_week+30.second, DateTime.now.end_of_week+30.second, @device).group_by_day_of_week(:created_at, format: "%a", week_start: :monday, day_start: 0.01).sum(:energy)
    render json: @energy_by_week
  end

  def by_month
    @device = params[:device]
    @energy_by_month = Measure.where('created_at BETWEEN ? AND ? AND device_id = ?', DateTime.now.beginning_of_month+30.second, DateTime.now.end_of_month+30.second, @device).group_by_day_of_month(:created_at, day_start: 0.01).sum(:energy)
    render json: @energy_by_month
  end

  def by_year
    @device = params[:device]
    @energy_by_year = Measure.where('created_at BETWEEN ? AND ? AND device_id = ?', DateTime.now.beginning_of_year+30.second, DateTime.now.end_of_year+30.second, @device).group_by_month_of_year(:created_at, format: "%b", day_start: 0.01).sum(:energy)
    render json: @energy_by_year
  end

  def by_user
    @start_date = params[:start_day].to_date
    @end_date = params[:end_day].to_date
    @device = params[:device]
    # improve this
    if @start_date == @end_date
      @energy_by_user = Measure.where('created_at BETWEEN ? AND ? AND device_id = ?', @start_date.beginning_of_day+30.second, @start_date.end_of_day+30.second, @device).group_by_hour_of_day(:created_at, day_start: 0.01).average(:energy)
    else
      # @energy_by_user = Measure.where('created_at BETWEEN ? AND ? AND device_id = ?', @start_date.beginning_of_day+30.second, @end_date.end_of_day+30.second, @device).group_by_day(:created_at, day_start: 0.01).sum(:energy)
      @energy_by_user = Measure.where('created_at BETWEEN ? AND ? AND device_id = ?', @start_date.beginning_of_day+30.second, @end_date.end_of_day+30.second, @device).group_by_hour_of_day(:created_at, day_start: 0.01).average(:energy)
    end
    render json: @energy_by_user
  end

end
