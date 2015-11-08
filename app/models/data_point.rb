class DataPoint < ActiveRecord::Base
  belongs_to :goal

  class << self
    def generate_data_points_for(goal)
      dates = self.send("#{goal.duration}_#{goal.frequency}_from", goal.start_date)
      dates.map{ |date|
        DataPoint.create(
            goal_id:        goal.id,
            start_date:     date,
            end_date:       date + (dates[1] - dates[0]),
            desired_amount: (goal.desired_total / dates.length).round(2) )
      }
    end

    def update_data_points_for(goal)
      raise "DataPoint.update_data_points_for not implemented."
    end

    def last_day_of_the_month(month, year)
      possibly_leapy = Date.new(year).leap? ? 28 : 29
      [nil, 31, possibly_leapy, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31][month]
    end

    def next_months(date, times)
      the_day = date.day
      (1..times).map{ |_|
        date = date.next_month
        last_day_of_current_month = last_day_of_the_month(date.month, date.year)
        Date.new(date.year, date.month, last_day_of_current_month >= the_day ? the_day : last_day_of_current_month)
      }
    end

    def next_weeks(date, times)
      (1..times).map{ |_| date + 7 }
    end

    def one_year_monthly_from(date)
      next_months(date, 12)
    end

    def one_year_weekly_from(date)
      next_months(date, 52)
    end

    def six_months_monthly_from(date)
      next_months(date, 6)
    end

    def six_months_weekly_from(date)
      next_weeks(date, ((((date >> 6) - date).to_i / 7).to_i / 7).floor)
    end

    def one_month_monthly_from(date)
      next_months(date, 1)
    end

    def one_month_weekly_from(date)
      next_weeks(date, ((date.next_month - date).to_i / 7).floor)
    end
  end

end
