json.array!(@goals) do |goal|
  json.extract! goal, :id, :name, :start_date, :duration, :frequency, :desired_total, :actual_total
  json.url goal_url(goal, format: :json)
end
