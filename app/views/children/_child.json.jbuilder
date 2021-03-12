json.extract! child, :id, :first_name, :last_name, :birthday, :sex, :location, :allergies_notes, :notes, :parent_id, :created_at, :updated_at
json.url child_url(child, format: :json)
