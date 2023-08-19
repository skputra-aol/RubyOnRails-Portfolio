class DashboardController < ApplicationController
  before_action :set_sidebar
  
  def index
  end

  private
  ## declare main globar var "@show_sidebar"
  def set_sidebar
      @show_sidebar = true
  end
end