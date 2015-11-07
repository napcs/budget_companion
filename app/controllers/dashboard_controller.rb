class DashboardController < ApplicationController
  before_action :authenticate_account!
  
  def show
    @expenses = current_account.expenses.where(
      "dueDate <= ? AND paid == ?", Date.today + 1.week, false
      
      ).order("dueDate ASC")
  end
  
end
