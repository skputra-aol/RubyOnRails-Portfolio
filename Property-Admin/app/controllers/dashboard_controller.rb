require 'active_support/core_ext/date'

class DashboardController < ApplicationController
  before_action :set_sidebar
  
  def index
    @dashboards =  DashboardService::QueryDashboard.call(params[:q]) 
    
  end

  private
  ## declare main globar var "@show_sidebar"
  def set_sidebar
      @show_sidebar = true
  end
end