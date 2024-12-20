json.extract! article, :id, :title, :url, :summary, :votes, :published, :summarized, :created_at, :updated_at
json.url article_url(article, format: :json)
