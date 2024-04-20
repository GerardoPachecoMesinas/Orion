class ReportsController < ApplicationController
  layout 'devise'
  
  def monthly_income_report
    start_date = Date.today.beginning_of_month
    end_date = Date.today.end_of_month
    @paid_services = Service.where("paid_at >= ? AND paid_at <= ?", start_date, end_date)
    @total_income = @paid_services.sum(:price)
  end
  
end
