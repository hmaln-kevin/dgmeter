class FpChartsController < ApplicationController
    before_action :authenticate_user!
    def by_day
      @device = params[:device]
      @pf_by_day = Measure.where('created_at BETWEEN ? AND ? AND device_id = ?', DateTime.now.beginning_of_day, DateTime.now.end_of_day, @device).group_by_hour_of_day(:created_at, day_start: 0.01).minimum(:pf)
      # :pf_by_day = Measure.where('created_at BETWEEN ? AND ? AND device_id = ?', DateTime.now.beginning_of_day, DateTime.now.end_of_day, @device).group_by_minute(:created_at, format: "%H:%M").minimum(:voltage)
      render json: @pf_by_day
    end
    # keep :pf_by_day to simplify :pf_by_week ?
    def by_week
      @device = params[:device]
      @pf_by_week = Measure.where('created_at BETWEEN ? AND ? AND device_id = ?', DateTime.now.beginning_of_week, DateTime.now.end_of_week, @device).group_by_day_of_week(:created_at, format: "%a", week_start: :monday).minimum(:pf)
      render json: @pf_by_week
    end
  
    def by_month
      @device = params[:device]
      @pf_by_month = Measure.where('created_at BETWEEN ? AND ? AND device_id = ?', DateTime.now.beginning_of_month, DateTime.now.end_of_month, @device).group_by_day_of_month(:created_at).minimum(:pf)
      render json: @pf_by_month
    end
  
    def by_year
      @device = params[:device]
      @pf_by_year = Measure.where('created_at BETWEEN ? AND ? AND device_id = ?', DateTime.now.beginning_of_year, DateTime.now.end_of_year, @device).group_by_month_of_year(:created_at, format: "%b").minimum(:pf)
      render json: @pf_by_year
    end
  
    def by_user
      @device = params[:device]
      @start_date = params[:start_day].to_date
      @end_date = params[:end_day].to_date
  
      if @start_date == @end_date
        @pf_by_user = Measure.where('created_at BETWEEN ? AND ? AND device_id = ?', @start_date.beginning_of_day, @start_date.end_of_day, @device).group_by_minute(:created_at, n:15, format: "%H:%M").minimum(:pf)
      else
        @pf_by_user = Measure.where('created_at BETWEEN ? AND ? AND device_id = ?', @start_date.beginning_of_day, @end_date.end_of_day, @device).group_by_day(:created_at).minimum(:pf)  
      end
      render json: @pf_by_user
    end
end
