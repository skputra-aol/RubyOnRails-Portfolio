json.extract! registration, :id, :property_id, :vendor_id, :pin_id, :tag_no, :note, :available, :created_at, :updated_at
json.url registration_url(registration, format: :json)
