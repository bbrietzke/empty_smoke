json.extract! article, :id, :title, :url, :description, :summary, :published, :summarized, :created_at, :updated_at
json.url article_url(article, format: :json)
