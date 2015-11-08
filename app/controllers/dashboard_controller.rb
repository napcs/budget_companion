class DashboardController < ApplicationController
  before_action :authenticate_account!
  
  def show
    
    @sort = params[:sort].blank? ? "week" : params[:sort]
    
    if @sort == "week" || @sort.blank?
      @expenses = current_account.expenses.where(
        "dueDate <= ? AND paid == ?", Date.today + 1.week, false
      ).order("dueDate ASC")
      
    elsif @sort == "month"
      @expenses = current_account.expenses.where(
        "dueDate <= ? AND paid == ?", Date.today + 4.week, false
      ).order("dueDate ASC")

    elsif @sort == "quarter"
      @expenses = current_account.expenses.where(
        "dueDate <= ? AND paid == ?", Date.today + 3.month, false
      ).order("dueDate ASC")
      
    elsif @sort == "year"
      @expenses = current_account.expenses.where(
        "dueDate <= ? AND paid == ?", Date.today + 1.year, false
      ).order("dueDate ASC") 
      
    end

    @sum = @expenses.inject(0){|sum, expense| sum += expense.amount}

    @goal_data_points = Goal.send("goals_for_the_#{@sort}", current_account)
  end
  
end
