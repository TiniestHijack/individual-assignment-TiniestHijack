json.extract! purchase, :id, :ownership, :customer_id, :movie_id, :created_at, :updated_at
json.url purchase_url(purchase, format: :json)
