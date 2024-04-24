class ReportsController < ApplicationController

  def monthly_income_report
    start_date = DateTime.current.beginning_of_month
    end_date = DateTime.current.end_of_month
    @paid_services = Service.where(paid_at: start_date..end_date)
    @total_income = @paid_services.sum(:price)
  end
end
