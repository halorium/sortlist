json.array!(@agencies) do |agency|
  json.extract! agency, :id, :name, :description, :grade, :tag_list
  json.url api_agency_url(agency, format: :json)
end
