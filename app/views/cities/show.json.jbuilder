json.array!(@city.branches) do |branch|
	json.array!(branch.products) do |product|
		json.extract! product, :name, :description, :value, :branch
	end
end
