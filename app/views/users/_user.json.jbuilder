json.extract! user, :id, :email, :first_name, :last_name, :admin, :created_at, :updated_at
json.url user_url(user, format: :json)
