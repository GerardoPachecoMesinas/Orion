json.extract! service_package, :id, :name, :price, :bandwidth, :clasification, :created_at, :updated_at
json.url service_package_url(service_package, format: :json)
