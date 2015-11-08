class Goal < ActiveRecord::Base
  has_many :data_points, :dependent => :destroy
  accepts_nested_attributes_for :data_points

  def self.durations()
    [ ["One Year", "one_year"],
      ["Six Months", "six_months"],
      ["One Month", "one_month"]
    ]
  end

  def self.frequencies()
    [ ["Monthly", "monthly"],
      ["Weekly", "weekly"]
    ]
  end
end
