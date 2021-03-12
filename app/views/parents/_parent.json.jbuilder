json.extract! parent, :id, :first_name, :last_name, :phone_primary, :phone_secondary, :primary_contract, :street, :province, :postal, :notes, :created_at, :updated_at
json.url parent_url(parent, format: :json)
