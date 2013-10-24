json.array!(@articles) do |article|
  json.extract! article, :title, :location, :excerpt, :published_at
  json.url article_url(article, format: :json)
end
