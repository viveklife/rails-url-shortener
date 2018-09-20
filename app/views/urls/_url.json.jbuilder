json.extract! url, :id, :original_url, :created_at, :updated_at
json.short_url short_url(url.short_url)
json.url url_url(url.short_url, format: :json)
