json.array!(@data_points) do |data_point|
  json.extract! data_point, :id, :goal_id, :desired_amount, :actual_amount, :start_date, :end_date
  json.url data_point_url(data_point, format: :json)
end
