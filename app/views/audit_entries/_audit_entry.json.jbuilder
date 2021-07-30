json.extract! audit_entry, :id, :user, :resource, :from, :to, :created_at, :updated_at
json.url audit_entry_url(audit_entry, format: :json)
