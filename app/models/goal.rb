class Goal < ActiveRecord::Base
  has_many :data_points, :dependent => :destroy
  belongs_to :account
  accepts_nested_attributes_for :data_points, :allow_destroy => true

  class << self
    def durations()
      [ ["One Year", "one_year"],
        ["Six Months", "six_months"],
        ["One Month", "one_month"]
      ]
    end

    def frequencies()
      [ ["Monthly", "monthly"],
        ["Weekly", "weekly"]
      ]
    end

    def scopes()
      {
          week:    Date.today + 1.week,
          month:   Date.today + 4.week,
          quarter: Date.today + 3.month,
          year:    Date.today + 1.year
      }
    end

    def get_due_dates_in_scope_for_user(scope, current_account)
      current_account.data_points.where(
          "due_date <= ? AND actual_amount < desired_amount", scope
      ).order("due_date ASC")
    end

    def goals_for_the_week(current_account)
      get_due_dates_in_scope_for_user(scopes[:week], current_account)
    end

    def goals_for_the_month(current_account)
      get_due_dates_in_scope_for_user(scopes[:month], current_account)
    end

    def goals_for_the_quarter(current_account)
      get_due_dates_in_scope_for_user(scopes[:quarter], current_account)
    end

    def goals_for_the_year(current_account)
      get_due_dates_in_scope_for_user(scopes[:year], current_account)
    end
  end
end
