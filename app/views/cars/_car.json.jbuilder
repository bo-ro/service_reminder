json.extract! car, :id, :name, :plate_number, :telephone_number, :last_serviced_at, :client_first_name, :client_last_name, :created_at, :updated_at
json.url car_url(car, format: :json)
