json.array!(@branches) do |branch|
  json.extract! branch, :id, :name, :phone, :city_id, :user_id
  json.url branch_url(branch, format: :json)
end
