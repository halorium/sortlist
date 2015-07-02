json.array!(@agencies) do |agency|
  json.extract! agency, :id, :name, :description, :grade, :tag_list
end
