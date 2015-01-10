json.array!(@listings) do |listing|
  json.extract! listing, :id, :name, :adress
  json.url flat_url(listing, format: :json)
end