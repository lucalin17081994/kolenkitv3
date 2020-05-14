json.extract! bestelling, :id, :cart_id, :address, :number, :created_at, :updated_at
json.url bestelling_url(bestelling, format: :json)
