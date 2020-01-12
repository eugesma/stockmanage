json.extract! client, :id, :store_id, :fullname, :dni, :cuit, :phone, :email, :created_at, :updated_at
json.url client_url(client, format: :json)
