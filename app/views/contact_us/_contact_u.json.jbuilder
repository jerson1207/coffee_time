json.extract! contact_u, :id, :name, :email, :message, :created_at, :updated_at
json.url contact_u_url(contact_u, format: :json)
